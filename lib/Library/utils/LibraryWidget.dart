import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umtb_library/Library/utils/LibraryColors.dart';
import 'package:umtb_library/Library/utils/LibraryConstant.dart';
import 'package:umtb_library/Library/utils/LibraryExtention.dart';

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
      child: Text(text,
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

Container bookContainer(icon, field, content, textColor, fontSize) {
  return Container(
      child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      svgPicture(icon),
      Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 4.0, 14.0, 4.0),
          child: Text(toCapitalized(field),
              style: TextStyle(
                  fontFamily: fontRegular,
                  color: colorAccentGrey,
                  fontSize: 20.0))),
      Flexible(
        child: Padding(
          padding: field == 'listing: '
              ? const EdgeInsets.fromLTRB(0, 0.0, 0, 0.0)
              : field == 'title: '
                  ? const EdgeInsets.fromLTRB(0, 6.0, 0, 6.0)
                  : const EdgeInsets.fromLTRB(0, 7.0, 0, 7.0),
          child: Text(toTitleCase(content) + "\n",
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: TextStyle(
                  fontFamily: fontRegular,
                  color: textColor,
                  fontSize: fontSize)),
        ),
      ),
    ],
  ));
}
