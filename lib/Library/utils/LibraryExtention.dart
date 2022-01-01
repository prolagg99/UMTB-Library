import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

changeStatusColor(Color color, {bool isWhite = true}) async {
  try {
    await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  } on Exception catch (e) {
    print(e);
  }
}

capitalization(content) {
  return content.replaceFirst(content[0], content[0].toUpperCase());
}
