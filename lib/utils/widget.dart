import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umtb_library/utils/colors.dart';
import 'package:umtb_library/utils/constant.dart';
import 'package:umtb_library/utils/extension.dart';

AppBar appBar(context) {
  return AppBar(
    automaticallyImplyLeading: true,
    backgroundColor: colorPrimary,
    elevation: 0,
    leading: new IconButton(
      icon: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
        child: new Icon(
          Icons.arrow_back,
          color: colorAccentGreen,
          size: 32.0,
        ),
      ),
      onPressed: () => back(context),
    ),
  );
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

Flexible textWidget(text, color, fontSize) {
  return Flexible(
      child: Text(text != null ? text : "",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontFamily: fontRegular, color: color, fontSize: fontSize)));
}

Flexible textWidgetRTL(text, color, fontSize) {
  return Flexible(
      child: Text(text,
          textDirection: TextDirection.rtl,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontFamily: fontRegular, color: color, fontSize: fontSize)));
}

SvgPicture svgPicture(icon) {
  return SvgPicture.asset(
    icon,
    height: 36,
    width: 36,
    color: colorAccentGrey,
  );
}

Widget bookContainer(icon, field, content, textColor, fontSize) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 14.0, 0, 0),
    child: Container(
        // color: Colors.red,
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        svgPicture(icon),
        Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 14.0, 4.0),
            child: Text(toCapitalized(field),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: fontRegular,
                    color: colorAccentGrey,
                    fontSize: 20.0))),
        Flexible(
          child: Padding(
            padding: arabicChar(content)
                ? const EdgeInsets.fromLTRB(0, 2.0, 0, 2.0)
                : field == 'listing: '
                    ? const EdgeInsets.fromLTRB(0, 0.0, 0, 0.0)
                    : field == 'title: '
                        ? const EdgeInsets.fromLTRB(0, 6.0, 0, 6.0)
                        : const EdgeInsets.fromLTRB(0, 7.0, 0, 7.0),
            child: Row(
              mainAxisAlignment: arabicChar(content) && field == 'title: '
                  ? MainAxisAlignment.end
                  : arabicChar(content) &&
                          (field == 'author: ' || field == 'subfiled: ')
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(toTitleCase(content) + "\n",
                      textDirection: arabicChar(content)
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: fontRegular,
                          color: textColor,
                          fontSize: fontSize)),
                ),
              ],
            ),
          ),
        ),
      ],
    )),
  );
}

// detect if the text have arabic char to make it RTL direction
final arabicCharExp = RegExp("^[\u0621-\u064A]", unicode: true);
bool arabicChar(String str) {
  return str != "" ? arabicCharExp.hasMatch(str) : false;
}
