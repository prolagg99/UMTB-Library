import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:umtb_library/Library/model/LibraryModels.dart';
import 'package:umtb_library/Library/screen/LibraryHome.dart';
import 'package:umtb_library/Library/utils/LibraryColors.dart';
import 'package:umtb_library/Library/utils/LibraryDataGenerator.dart';
import 'package:umtb_library/Library/utils/LibraryImage.dart';
import 'package:umtb_library/Library/utils/LibraryWidget.dart';

class LibrarySearchBar extends StatefulWidget {
  const LibrarySearchBar({Key? key}) : super(key: key);
  @override
  _LibrarySearchBarState createState() => _LibrarySearchBarState();
}

class _LibrarySearchBarState extends State<LibrarySearchBar> {
  final SearchBarController<BookDetails> _searchBarController =
      SearchBarController();
  // bool isReplay = false;
  late List<BookDetails> mListings;
  @override
  void initState() {
    super.initState();
    mListings = getBookDetails();
  }

  Future<List<BookDetails>> _getALlPosts(String text) async {
    List<BookDetails> posts = mListings
        .where((element) =>
            element.title.contains(text) ||
            element.author.contains(text) ||
            element.subfield.contains(text) ||
            element.speciality.contains(text))
        .toList();
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: SearchBar<BookDetails>(
          hintText: 'search',
          hintStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
              color: Colors.grey[800]),
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
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mListings.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return BookCard(mListings[index]);
                  }),
            ),
          ),
          cancellationWidget:
              Text("Cancel", style: TextStyle(color: colorAccentGreyIcon)),
          emptyWidget: Text("empty"), // need a modification
          // onCancelled: () {
          //   print("Cancelled triggered");
          // },
          // mainAxisSpacing: 10,
          onItemFound: (BookDetails post, int index) {
            return BookCard(post);
          },
        ),
      ),
    );
  }
}
