import 'package:flutter/material.dart';
import 'package:umtb_library/screens/LibraryHome.dart';
import 'package:umtb_library/services/getDocuments.dart';
import 'package:umtb_library/utils/colors.dart';
import 'package:umtb_library/utils/extension.dart';
import 'package:umtb_library/utils/images.dart';

class LibraryLoading extends StatefulWidget {
  LibraryLoading({Key? key}) : super(key: key);
  static String tag = '/LibraryLoading';

  @override
  State<LibraryLoading> createState() => _LibraryLoadingState();
}

class _LibraryLoadingState extends State<LibraryLoading> {
  GetDocuments instance = GetDocuments();

  void loading() async {
    // await instance.getAllDocuments();
    await Future.delayed(Duration(seconds: 3));
    launchScreen(context, LibraryHome.tag);
  }

  @override
  void initState() {
    super.initState();
    loading();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(colorPrimary);
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
          child: Container(
        color: colorPrimary,
        child: Center(
          child: Image.asset(
            ic_luncher_screen,
            height: 68.0,
            width: 68.0,
          ),
        ),
      )),
    );
  }
}
