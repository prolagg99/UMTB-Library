// import 'dart:math';

// import 'package:flappy_search_bar/flappy_search_bar.dart';
// import 'package:flappy_search_bar/scaled_tile.dart';
// import 'package:flutter/material.dart';
// import 'package:umtb_library/Library/model/LibraryModels.dart';
// import 'package:umtb_library/Library/utils/LibraryDataGenerator.dart';

// class SearchTest extends StatefulWidget {
//   @override
//   _SearchTestState createState() => _SearchTestState();
// }

// class _SearchTestState extends State<SearchTest> {
//   final SearchBarController<BookDetails> _searchBarController =
//       SearchBarController();
//   bool isReplay = false;
//   late List<BookDetails> mListings;

//   @override
//   void initState() {
//     super.initState();
//     mListings = getBookDetails();
//   }

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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SearchBar<BookDetails>(
//           minimumChars: 1,
//           searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
//           headerPadding: EdgeInsets.symmetric(horizontal: 10),
//           listPadding: EdgeInsets.symmetric(horizontal: 10),
//           onSearch: _getALlPosts,
//           searchBarController: _searchBarController,
//           placeHolder: Center(
//               child: Text(
//             "PlaceHolder",
//             style: TextStyle(fontSize: 30),
//           )),
//           cancellationWidget: Text("Cancel"),
//           emptyWidget: Text("empty"),
//           onCancelled: () {
//             print("Cancelled triggered");
//           },
//           mainAxisSpacing: 10,
//           onItemFound: (BookDetails post, int index) {
//             return Container(
//               color: Colors.lightBlue,
//               child: ListTile(
//                 title: Text(post.title),
//                 isThreeLine: true,
//                 subtitle: Text(post.subfield),
//                 onTap: () {
//                   Navigator.of(context)
//                       .push(MaterialPageRoute(builder: (context) => Detail()));
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class Detail extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             Text("Detail"),
//           ],
//         ),
//       ),
//     );
//   }
// }
