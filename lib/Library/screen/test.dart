// import 'package:flappy_search_bar/search_bar_style.dart';
// import 'package:flutter/material.dart';
// import 'package:flappy_search_bar/flappy_search_bar.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:umtb_library/Library/model/LibraryModels.dart';
// import 'package:umtb_library/Library/screen/LibraryBookDetails.dart';
// import 'package:umtb_library/Library/screen/LibraryHome.dart';
// import 'dart:math';
// import 'package:umtb_library/Library/utils/LibraryColors.dart';
// import 'package:umtb_library/Library/utils/LibraryDataGenerator.dart';
// import 'package:umtb_library/Library/utils/LibraryExtention.dart';
// import 'package:umtb_library/Library/utils/LibraryImage.dart';
// import 'package:umtb_library/Library/utils/LibraryWidget.dart';

// class LibrarySearchBar extends StatefulWidget {
//   const LibrarySearchBar({Key? key}) : super(key: key);
//   @override
//   _LibrarySearchBarState createState() => _LibrarySearchBarState();
// }

// class _LibrarySearchBarState extends State<LibrarySearchBar> {
//   final SearchBarController<LibraryBookDetails> _searchBarController =
//       SearchBarController();
//   bool isReplay = false;
//   late List<LibraryBookDetails> mListings;
//   @override
//   void initState() {
//     super.initState();
//     mListings = getBookDetails();
//   }

//   Future<List<LibraryBookDetails>> _getALlPosts(String text) async {
//     List<LibraryBookDetails> posts = mListings
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
//       backgroundColor: colorPrimary,
//       body: SafeArea(
//         child: SearchBar<LibraryBookDetails>(
//           hintText: 'search',
//           hintStyle: TextStyle(
//               fontSize: 16.0,
//               fontWeight: FontWeight.w300,
//               color: Colors.grey[800]),
//           icon: ic_search,
//           textStyle: TextStyle(color: Colors.white),
//           searchBarStyle: SearchBarStyle(
//             padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
//             backgroundColor: colorPrimary_light,
//             borderRadius: BorderRadius.circular(26),
//           ),
//           minimumChars: 1,
//           searchBarPadding: EdgeInsets.symmetric(horizontal: 22),
//           headerPadding: EdgeInsets.symmetric(horizontal: 30),
//           listPadding: EdgeInsets.symmetric(horizontal: 30),
//           onSearch: _getALlPosts,
//           searchBarController: _searchBarController,
//           placeHolder: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: ScrollConfiguration(
//               behavior: MyBehavior(),
//               child: ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   itemCount: mListings.length,
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) {
//                     return BookCardTest(mListings[index]);
//                   }),
//             ),
//           ),
//           cancellationWidget: Text(
//             'Cancel',
//             style: TextStyle(color: colorAccentGreyIcon),
//           ),
//           emptyWidget: Container(
//             height: MediaQuery.of(context).size.height,
//             color: Colors.black,
//           ),
//           onCancelled: () {
//             print("Cancelled triggered");
//           },
//           mainAxisSpacing: 10,
//           onItemFound: (LibraryBookDetails post, int index) {
//             return Container(
//               color: Colors.red,
//               child: ListTile(
//                 title: Text(post.title),
//                 isThreeLine: true,
//                 subtitle: Text(post.body),
//                 onTap: () {
//                   Navigator.of(context)
//                       .push(MaterialPageRoute(builder: (context) => Detail()));
//                 },
//               ),
//             );
//             Expanded(
//               child: Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 child: ScrollConfiguration(
//                   behavior: MyBehavior(),
//                   child: ListView.builder(
//                       scrollDirection: Axis.vertical,
//                       itemCount: mListings.length,
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         return BookCardTest(post);
//                       }),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class Post {
//   final String title;
//   final String body;

//   Post(this.title, this.body);
// }

// class Detail extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(
//         child: Center(
//             child: Text(
//           "Detail",
//           style: TextStyle(fontSize: 30),
//         )),
//       ),
//     );
//   }
// }

// class BookCardTest extends StatelessWidget {
//   late LibraryBookDetails model;
//   BookCardTest(LibraryBookDetails model) {
//     this.model = model;
//   }

//   final arabicCharExp = RegExp("^[\u0621-\u064A]", unicode: true);
//   bool arabicChar(String str) {
//     return arabicCharExp.hasMatch(str);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(18, 19, 18, 17),
//       child: GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => Detail()),
//           );
//         },
//         child: Container(
//           width: 350,
//           height: 104,
//           decoration: BoxDecoration(
//             color: colorPrimary_light,
//             borderRadius: BorderRadius.circular(22),
//           ),
//           child: Row(
//             children: <Widget>[
//               Container(
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
//                       child: Container(
//                         width: 40.0,
//                         height: 40.0,
//                         decoration: BoxDecoration(
//                           color: colorPrimary,
//                           borderRadius: BorderRadius.circular(05),
//                         ),
//                         child: Icon(
//                           Icons.article,
//                           color: colorAccentBlue,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(6.0, 4.0, 12.0, 4.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           flex: 1,
//                           child: Container(
//                             child: Row(
//                                 mainAxisAlignment: arabicChar(model.title)
//                                     ? MainAxisAlignment.center
//                                     : MainAxisAlignment.start,
//                                 children: [
//                                   arabicChar(model.title)
//                                       ? textWidgetRTL(toTitleCase(model.title),
//                                           colorAccentGrey, 16.0)
//                                       : textWidget(toTitleCase(model.title),
//                                           colorAccentGrey, 16.0),
//                                 ]),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 0,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(
//                                 width: 108,
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         SvgPicture.asset(
//                                           'images/users.svg',
//                                           height: 16,
//                                           width: 16,
//                                           color: colorAccentGrey,
//                                         ),
//                                         SizedBox(width: 8.0),
//                                         arabicChar(model.author)
//                                             ? textWidgetRTL(
//                                                 toTitleCase(model.author),
//                                                 colorAccentGrey,
//                                                 11.0)
//                                             : textWidget(
//                                                 toTitleCase(model.author),
//                                                 colorAccentGrey,
//                                                 11.0),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(width: 12.0),
//                               Container(
//                                 width: 108,
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         SvgPicture.asset(
//                                           'images/sliders.svg',
//                                           height: 16,
//                                           width: 16,
//                                           color: colorAccentGrey,
//                                         ),
//                                         SizedBox(width: 8.0),
//                                         textWidget(
//                                             model.speciality.toUpperCase(),
//                                             colorAccentGrey,
//                                             11.0),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           flex: 1,
//                           child: Container(
//                             child: Row(
//                               mainAxisAlignment: arabicChar(model.subfield)
//                                   ? MainAxisAlignment.end
//                                   : MainAxisAlignment.start,
//                               children: [
//                                 arabicChar(model.subfield)
//                                     ? textWidgetRTL(toTitleCase(model.subfield),
//                                         Colors.white, 14.0)
//                                     : textWidget(toTitleCase(model.subfield),
//                                         Colors.white, 14.0),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 0,
//                           child: Container(
//                               width: 160,
//                               decoration: BoxDecoration(
//                                 color: colorPrimary,
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.fromLTRB(16, 1.0, 16, 1.0),
//                                 child: Row(
//                                   children: [
//                                     Icon(
//                                       Icons.check_circle,
//                                       color: Colors.white,
//                                       size: 16.0,
//                                     ),
//                                     SizedBox(width: 8.0),
//                                     textWidget(toTitleCase(model.listing),
//                                         colorAccentGrey, 14.0),
//                                   ],
//                                 ),
//                               )),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
