import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:umtb_library/Library/screen/LibraryHome.dart';
import 'package:umtb_library/Library/utils/LibraryColors.dart';
import 'package:umtb_library/Library/utils/LibraryExtention.dart';

class LibraryLoading extends StatefulWidget {
  static String tag = '/LibraryLoading';

  @override
  State<LibraryLoading> createState() => _LibraryLoadingState();
}

class _LibraryLoadingState extends State<LibraryLoading> {
  void loading() async {
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
    changeStatusColor(colorPrimary_light);
    return Container(
      color: colorPrimary_light,
      child: Center(
        child: SpinKitChasingDots(
          color: colorPrimary,
          size: 50.0,
        ),
      ),
    );
  }
}
