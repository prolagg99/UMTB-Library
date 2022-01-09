import 'package:flutter/material.dart';
// import 'package:umtb_library/Library/screen/LibraryHome.dart';
import 'package:umtb_library/Library/utils/LibrarySearchBar.dart';
import 'package:umtb_library/Library/utils/LibrarySearchBarTest.dart';
import 'package:umtb_library/Library/utils/LibraryTest.dart';

void main() {
  runApp(Library());
}

class Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (context) => LibrarySearchBar(),
      },
    );
  }
}
