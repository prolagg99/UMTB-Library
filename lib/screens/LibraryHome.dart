import 'package:flutter/material.dart';
import 'package:umtb_library/screens/SearchBarWidget.dart';
import 'package:umtb_library/utils/colors.dart';
import 'package:umtb_library/utils/extension.dart';

class LibraryHome extends StatefulWidget {
  static String tag = '/LibraryHome';

  const LibraryHome({Key? key}) : super(key: key);
  @override
  _LibraryHomeState createState() => _LibraryHomeState();
}

class _LibraryHomeState extends State<LibraryHome> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(colorPrimary);
    return Scaffold(
        backgroundColor: colorPrimary,
        body: SafeArea(
          child: SearchBarWidget(),
        ));
    // );
  }
}
