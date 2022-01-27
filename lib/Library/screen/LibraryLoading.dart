import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:umtb_library/Library/screen/LibraryHome.dart';
import 'package:umtb_library/Library/services/getDocuments.dart';
import 'package:umtb_library/Library/utils/LibraryColors.dart';
import 'package:umtb_library/Library/utils/LibraryExtention.dart';

class LibraryLoading extends StatefulWidget {
  LibraryLoading({Key? key}) : super(key: key);
  static String tag = '/LibraryLoading';

  @override
  State<LibraryLoading> createState() => _LibraryLoadingState();
}

class _LibraryLoadingState extends State<LibraryLoading> {
  GetDocuments instance = GetDocuments();

  void loading() async {
    await instance.getAllDocuments();
    // await Future.delayed(Duration(seconds: 3));
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
          child: SpinKitChasingDots(
            color: colorPrimary_light,
            size: 50.0,
          ),
        ),
      )),
    );
  }
}
