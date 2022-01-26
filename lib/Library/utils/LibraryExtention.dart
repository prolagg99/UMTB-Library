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

launchScreen(context, String tag, {Object? arguments}) {
  if (arguments == null) {
    Navigator.pushNamed(context, tag);
  } else {
    Navigator.pushNamed(context, tag, arguments: arguments);
  }
}

toCapitalized(var content) {
  return content != ""
      ? content.replaceFirst(content[0], content[0].toUpperCase())
      : "";
}

toTitleCase(var content) {
  return content != ""
      ? content
          .replaceAll(RegExp(' +'), ' ')
          .split(' ')
          .map((content) => toCapitalized(content))
          .join(' ')
      : "";
}

toLowerCase(var content){
  return content != "" ?
  content.toLowerCase() : "" ;

}

back(var context) {
  Navigator.pop(context);
}
