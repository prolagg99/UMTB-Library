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

toCapitalized(var content) {
  return content.replaceFirst(content[0], content[0].toUpperCase());
}

toTitleCase(var content) {
  return content
      .replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((content) => toCapitalized(content))
      .join(' ');
}

back(var context) {
  Navigator.pop(context);
}
