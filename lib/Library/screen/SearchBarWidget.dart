import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:umtb_library/Library/model/LibraryModels.dart';
import 'package:umtb_library/Library/screen/BookCard.dart';
import 'package:umtb_library/Library/services/getDocuments.dart';
import 'package:umtb_library/Library/utils/LibraryColors.dart';
import 'package:umtb_library/Library/utils/LibraryImage.dart';
import 'package:umtb_library/Library/utils/LibraryWidget.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final SearchBarController<BookDetails> _searchBarController =
      SearchBarController();
  var scrollController = ScrollController();
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<BookDetails> mListings = [];
  // GetDocuments instance = GetDocuments();

  @override
  void initState() {
    super.initState();
    getDocuments();
    // instance.getDocuments();
    getAllDocuments(); // for the search bar
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0)
          print('ListView scroll at top');
        else {
          print('ListView scroll at bottom');
          getDocumentsNext(); // Load next documents
        }
      }
    });
  }

  List<BookDetails> listAllDocument = [];
// get all data from db to search elements
  Future<void> getAllDocuments() async {
    bookCollection.get().then((value) {
      // snapshot = value; // store collection state to set where to start next
      return value.docs.forEach((doc) {
        print('getDocuments ${doc.data()}');
        listAllDocument.add(
          BookDetails(
            author: doc.data().toString().contains('Author')
                ? doc.get('Author')
                : '',
            listing: doc.data().toString().contains('Listing')
                ? doc.get('Listing')
                : '',
            speciality: doc.data().toString().contains('Speciality')
                ? doc.get('Speciality')
                : '',
            subfield: doc.data().toString().contains('Subfield')
                ? doc.get('Subfield')
                : '',
            title:
                doc.data().toString().contains('Title') ? doc.get('Title') : '',
          ),
        );
      });
    });
  }

//   List<BookDetails> listAllDocument = [];
// // get all data from db to search elements
//   Future<void> getAllDocuments() async {
//     bookCollection.get().then((value) {
//       // snapshot = value; // store collection state to set where to start next
//       return value.docs.forEach((doc) {
//         print('getDocuments ${doc.data()}');
//         setState(() {
//           listAllDocument.add(
//             BookDetails(
//               author: doc.data().toString().contains('Author')
//                   ? doc.get('Author')
//                   : '',
//               listing: doc.data().toString().contains('Listing')
//                   ? doc.get('Listing')
//                   : '',
//               speciality: doc.data().toString().contains('Speciality')
//                   ? doc.get('Speciality')
//                   : '',
//               subfield: doc.data().toString().contains('Subfield')
//                   ? doc.get('Subfield')
//                   : '',
//               title: doc.data().toString().contains('Title')
//                   ? doc.get('Title')
//                   : '',
//             ),
//           );
//         });
//       });
//     });
//   }

  // bool isReplay = false;
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance!.addPostFrameCallback((_) {
  //     _addBooks();
  //   });
  // }

  // search item
  Future<List<BookDetails>> _getALlPosts(String text) async {
    List<BookDetails> posts = listAllDocument
        .where((element) =>
            element.title.contains(text) ||
            element.author.contains(text) ||
            element.subfield.contains(text) ||
            element.speciality.contains(text))
        .toList();
    return posts;
  }

  // void _addBooks() {
  //   // get data from db
  //   mListings = getBookDetails();
  //   Future ft = Future(() {});

  //   mListings.forEach((element) {
  //     ft = ft.then((data) {
  //       return Future.delayed(const Duration(milliseconds: 100), () {
  //         _listKey.currentState!.insertItem(mListings.indexOf(element));
  //       });
  //     });
  //   });
  // }

  // Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));
  @override
  Widget build(BuildContext context) {
    return SearchBar<BookDetails>(
      hintText: 'search',
      hintStyle: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.grey[800]),
      icon: ic_search,
      textStyle: TextStyle(color: Colors.white),
      searchBarStyle: SearchBarStyle(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
        backgroundColor: colorPrimary_light,
        borderRadius: BorderRadius.circular(26),
      ),
      minimumChars: 1,
      searchBarPadding: EdgeInsets.symmetric(horizontal: 22),
      onSearch: _getALlPosts,
      searchBarController: _searchBarController,
      placeHolder: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: listOfDocument.length != 0
              ? RefreshIndicator(
                  child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      controller: scrollController,
                      key: _listKey,
                      scrollDirection: Axis.vertical,
                      itemCount: listOfDocument.length,
                      shrinkWrap: true,
                      itemBuilder: (context, indx) {
                        // return SlideTransition(
                        // position: animation.drive(_offset),
                        return BookCard(listOfDocument[indx]);
                      }),
                  onRefresh: getDocuments,
                )
              : CircularProgressIndicator(),
        ),
      ),
      cancellationWidget:
          Text("Cancel", style: TextStyle(color: colorAccentGreyIcon)),
      emptyWidget: Text("empty"), // need a modification
      onItemFound: (BookDetails post, int index) {
        return BookCard(
          post,
        );
      },
    );
  }

  List<BookDetails> listOfDocument = [];
  late QuerySnapshot snapshot;
  final CollectionReference bookCollection =
      FirebaseFirestore.instance.collection('booksJson');

// Fetch first 15 documents
  Future<void> getDocuments() async {
    var collection = bookCollection.limit(10);
    print('getDocuments');
    fetchDocuments(collection);
  }

// Fetch next 5 documents starting from the last document fetched earlier
  Future<void> getDocumentsNext() async {
    // Get the last visible document
    var lastVisible = snapshot.docs[snapshot.docs.length - 1];
    print('listDocument legnth: ${snapshot.size} last: $lastVisible');
    var collection = bookCollection.startAfterDocument(lastVisible).limit(5);
    fetchDocuments(collection);
  }

  fetchDocuments(Query collection) {
    collection.get().then((value) {
      snapshot = value; // store collection state to set where to start next
      value.docs.forEach((doc) {
        print('getDocuments ${doc.data()}');
        setState(() {
          listOfDocument.add(
            BookDetails(
              author: doc.data().toString().contains('Author')
                  ? doc.get('Author')
                  : '',
              listing: doc.data().toString().contains('Listing')
                  ? doc.get('Listing')
                  : '',
              speciality: doc.data().toString().contains('Speciality')
                  ? doc.get('Speciality')
                  : '',
              subfield: doc.data().toString().contains('Subfield')
                  ? doc.get('Subfield')
                  : '',
              title: doc.data().toString().contains('Title')
                  ? doc.get('Title')
                  : '',
            ),
          );
        });
      });
    });
  }
}
