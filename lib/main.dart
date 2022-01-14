import 'package:flutter/material.dart';
import 'package:umtb_library/Library/screen/LibraryHome.dart';

void main() {
  runApp(Library());
}

class Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (context) => LibraryHome(),
      },
    );
  }
}
