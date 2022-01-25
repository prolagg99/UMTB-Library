// import 'package:flappy_search_bar/search_bar_style.dart';
// import 'package:flutter/material.dart';
// import 'package:flappy_search_bar/flappy_search_bar.dart';
// import 'package:provider/provider.dart';
// import 'package:umtb_library/Library/model/LibraryModels.dart';
// import 'package:umtb_library/Library/screen/BookCard.dart';
// import 'package:umtb_library/Library/services/database.dart';
// import 'package:umtb_library/Library/utils/LibraryColors.dart';
// import 'package:umtb_library/Library/utils/LibraryDataGenerator.dart';
// import 'package:umtb_library/Library/utils/LibraryImage.dart';
// import 'package:umtb_library/Library/utils/LibraryWidget.dart';

// class SearchBarWidget extends StatefulWidget {
//   const SearchBarWidget({Key? key}) : super(key: key);

//   @override
//   _SearchBarWidgetState createState() => _SearchBarWidgetState();
// }

// class _SearchBarWidgetState extends State<SearchBarWidget> {
//   final SearchBarController<BookDetails> _searchBarController =
//       SearchBarController();
//   GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
//   List<BookDetails> mListings = [];

//   // to cntrolle the scroll
//   late ScrollController _listScrollController;
//   DatabaseService _databaseService = DatabaseService();
//   // int loadMoreMsgs = 8; // at first it will load only 25
//   int a = 10;

//   @override
//   void initState() {
//     _listScrollController = ScrollController()
//       ..addListener(() {
//         if (_listScrollController.position.atEdge) {
//           if (_listScrollController.position.pixels == 0)
//             print('ListView scrolled to top');
//           else {
//             setState(() {
//               // loadMoreMsgs = loadMoreMsgs + a;
//               _databaseService.loadMoreData = a;
//             });
//             print('ListView scrolled to bottom');
//           }
//         }
//       });
//     super.initState();
//   }

//   // bool isReplay = false;
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   WidgetsBinding.instance!.addPostFrameCallback((_) {
//   //     _addBooks();
//   //   });
//   // }

//   // search item
//   Future<List<BookDetails>> _getALlPosts(String text) async {
//     List<BookDetails> posts = mListings
//         .where((element) =>
//             element.title.contains(text) ||
//             element.author.contains(text) ||
//             element.subfield.contains(text) ||
//             element.speciality.contains(text))
//         .toList();
//     return posts;
//   }

//   // void _addBooks() {
//   //   // get data from db
//   //   mListings = getBookDetails();
//   //   Future ft = Future(() {});

//   //   mListings.forEach((element) {
//   //     ft = ft.then((data) {
//   //       return Future.delayed(const Duration(milliseconds: 100), () {
//   //         _listKey.currentState!.insertItem(mListings.indexOf(element));
//   //       });
//   //     });
//   //   });
//   // }

//   Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));
//   @override
//   Widget build(BuildContext context) {
//     List<BookDetails> books = Provider.of<List<BookDetails>>(context);

//     return SearchBar<BookDetails>(
//       hintText: 'search',
//       hintStyle: TextStyle(
//           fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.grey[800]),
//       icon: ic_search,
//       textStyle: TextStyle(color: Colors.white),
//       searchBarStyle: SearchBarStyle(
//         padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
//         backgroundColor: colorPrimary_light,
//         borderRadius: BorderRadius.circular(26),
//       ),
//       minimumChars: 1,
//       searchBarPadding: EdgeInsets.symmetric(horizontal: 22),
//       onSearch: _getALlPosts,
//       searchBarController: _searchBarController,
//       placeHolder: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: ScrollConfiguration(
//           behavior: MyBehavior(),
//           child: ListView.builder(
//               physics: AlwaysScrollableScrollPhysics(),
//               controller: _listScrollController,
//               key: _listKey,
//               scrollDirection: Axis.vertical,
//               itemCount: books.length,
//               shrinkWrap: true,
//               itemBuilder: (context, indx) {
//                 // return SlideTransition(
//                 // position: animation.drive(_offset),
//                 return BookCard(books[indx]);
//               }),
//         ),
//       ),
//       cancellationWidget:
//           Text("Cancel", style: TextStyle(color: colorAccentGreyIcon)),
//       emptyWidget: Text("empty"), // need a modification
//       onItemFound: (BookDetails post, int index) {
//         return BookCard(
//           post,
//         );
//       },
//     );
//   }
// }
