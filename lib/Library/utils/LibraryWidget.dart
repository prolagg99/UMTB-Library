import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umtb_library/Library/utils/LibraryColors.dart';
import 'package:umtb_library/Library/utils/LibraryExtention.dart';

Flexible textWidget(text, color, fontSize) {
  return Flexible(
      child: Text(text,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
            color: color,
            fontSize: fontSize,
          )));
}

Flexible textWidgetRTL(text, color, fontSize) {
  return Flexible(
      child: Text(text,
          textDirection: TextDirection.rtl,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
            color: color,
            fontSize: fontSize,
          )));
}

SvgPicture svgPicture(icon) {
  return SvgPicture.asset(
    icon,
    height: 36,
    width: 36,
    color: colorAccentGray,
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
        child: Text(
          capitalization(field),
          style: GoogleFonts.montserrat(color: colorAccentGray, fontSize: 20.0),
        ),
      ),
      Flexible(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
          child: Text(
            capitalization(content) + "\n",
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: GoogleFonts.montserrat(color: textColor, fontSize: fontSize),
          ),
        ),
      ),
    ],
  ));
}
