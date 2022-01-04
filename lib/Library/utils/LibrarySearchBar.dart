import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'dart:math';

import 'package:umtb_library/Library/utils/LibraryColors.dart';
import 'package:umtb_library/Library/utils/LibraryImage.dart';

class LibrarySearchBar extends StatefulWidget {
  const LibrarySearchBar({Key? key}) : super(key: key);

  @override
  _LibrarySearchBarState createState() => _LibrarySearchBarState();
}

class _LibrarySearchBarState extends State<LibrarySearchBar> {
  final SearchBarController<Post> _searchBarController = SearchBarController();
  bool isReplay = false;

  Future<List<Post>> _getALlPosts(String text) async {
    List<Post> posts = [];

    var random = new Random();
    for (int i = 0; i < 10; i++) {
      posts
          .add(Post("$text $i", "body random number : ${random.nextInt(100)}"));
    }
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: SearchBar<Post>(
          hintText: 'search',
          icon: ic_search,
          textStyle: TextStyle(color: Colors.white),
          searchBarStyle: SearchBarStyle(
            // padding: EdgeInsets.all(10),
            backgroundColor: colorPrimary_light,
            borderRadius: BorderRadius.circular(65),
          ),
          minimumChars: 1,
          searchBarPadding: EdgeInsets.symmetric(horizontal: 20),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          onSearch: _getALlPosts,
          searchBarController: _searchBarController,
          // placeHolder: Center(
          //     child: Text(
          //   "PlaceHolder",
          //   style: TextStyle(fontSize: 30),
          // )),
          // cancellationWidget: Icon(Icons.cancel),
          // emptyWidget: Text("empty"),
          // onCancelled: () {
          //   print("Cancelled triggered");
          // },
          mainAxisSpacing: 10,
          onItemFound: (Post post, int index) {
            return Container(
              color: Colors.red,
              child: ListTile(
                title: Text(post.title),
                isThreeLine: true,
                subtitle: Text(post.body),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Detail()));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class Post {
  final String title;
  final String body;

  Post(this.title, this.body);
}

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
            child: Text(
          "Detail",
          style: TextStyle(fontSize: 30),
        )),
      ),
    );
  }
}
