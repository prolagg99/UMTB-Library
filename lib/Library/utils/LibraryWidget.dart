import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umtb_library/Library/utils/LibraryColors.dart';

Flexible textWidget(text, fontSize) {
  return Flexible(
      child: Text(text,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
            color: colorAccentGray,
            fontSize: fontSize,
          )));
}
