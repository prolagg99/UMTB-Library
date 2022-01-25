import 'package:flutter/material.dart';
import 'package:umtb_library/Library/screen/SearchBarWidget.dart';
import 'package:umtb_library/Library/utils/LibraryColors.dart';
import 'package:umtb_library/Library/utils/LibraryExtention.dart';

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
    return
        // StreamProvider<List<BookDetails>>.value(
        //     initialData: [],
        //     value: DatabaseService().books,
        // child:
        Scaffold(
            backgroundColor: colorPrimary,
            body: SafeArea(
              child: SearchBarWidget(),
            ));
    // );
  }
}
