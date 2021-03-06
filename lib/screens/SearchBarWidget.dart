// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:umtb_library/model/LibraryModels.dart';
import 'package:umtb_library/screens/BookCard.dart';
import 'package:umtb_library/services/getDocuments.dart';
import 'package:umtb_library/utils/colors.dart';
import 'package:umtb_library/utils/images.dart';
import 'package:umtb_library/utils/widget.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  SearchBarController<BookDetails> _searchBarController = SearchBarController();
  var scrollController = ScrollController();
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  GetDocuments instance = GetDocuments();
  // List<BookDetails> mListings = [];
  // bool isReplay = false;

  @override
  void initState() {
    super.initState();
    instance.getAllDocuments(); // for the search bar

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // _addBooks();
      getDocuments();
      scrollController.addListener(() {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels == 0)
            print('ListView scroll at top');
          else {
            print('ListView scroll at bottom');
            getDocumentsNext();
            // Load next documents
          }
        }
      });
    });
  }

  // void _addBooks() {
  //   print(" list offfffffffffffffffff ${listOfDocument.length}");
  //   Future ft = Future(() {});
  //   listOfDocument.forEach((element) {
  //     ft = ft.then((data) {
  //       return Future.delayed(const Duration(milliseconds: 100), () {
  //         mListings.add(element);
  //         _listKey.currentState!.insertItem(mListings.length - 1);
  //       });
  //     });
  //   });
  // }

  // search item
  Future<List<BookDetails>> _getALlPosts(String text) async {
    List<BookDetails> posts = instance.listAllDocument
        .where((element) =>
            element.title.contains(text) ||
            element.author.contains(text) ||
            element.subfield.contains(text) ||
            element.speciality.contains(text))
        .toList();
    return posts;
  }

  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));
  @override
  Widget build(BuildContext context) {
    return
        // listOfDocument.length != 0
        //     ?
        SearchBar<BookDetails>(
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
            child: AnimatedList(
                physics: AlwaysScrollableScrollPhysics(),
                controller: scrollController,
                key: _listKey,
                scrollDirection: Axis.vertical,
                initialItemCount: listOfDocument.length,
                shrinkWrap: true,
                itemBuilder: (context, indx, animation) {
                  return SlideTransition(
                      position: animation.drive(_offset),
                      child: BookCard(listOfDocument[indx]));
                })),
      ),
      cancellationWidget:
          Text("Cancel", style: TextStyle(color: colorAccentGreyIcon)),
      emptyWidget: Container(
        color: colorPrimary,
      ), // need a modification
      onItemFound: (BookDetails post, int index) {
        return BookCard(
          post,
        );
      },
    );
    // : Container(
    //     color: colorPrimary,
    //     child: Center(
    //       child: SpinKitChasingDots(
    //         color: colorPrimary_light,
    //         size: 50.0,
    //       ),
    //     ),
    //   );
  }

  List<BookDetails> listOfDocument = [];
  late QuerySnapshot snapshot;
  final CollectionReference bookCollection =
      FirebaseFirestore.instance.collection('booksJson');

// Fetch first 15 documents
  Future<void> getDocuments() async {
    var collection = bookCollection.limit(5);
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
    Future ft = Future(() {});
    collection.get().then((value) {
      snapshot = value; // store collection state to set where to start next
      value.docs.forEach((doc) {
        print('getDocuments ${doc.data()}');
        ft = ft.then((data) {
          return Future.delayed(const Duration(milliseconds: 200), () {
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
              _listKey.currentState!.insertItem(listOfDocument.length - 1);
            });
          });
        });
      });
    });
  }
}
