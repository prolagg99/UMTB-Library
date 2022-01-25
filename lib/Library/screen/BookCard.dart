import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umtb_library/Library/model/LibraryModels.dart';
import 'package:umtb_library/Library/screen/LibraryBookDetails.dart';
import 'package:umtb_library/Library/utils/LibraryColors.dart';
import 'package:umtb_library/Library/utils/LibraryExtention.dart';
import 'package:umtb_library/Library/utils/LibraryWidget.dart';

// ignore: must_be_immutable
class BookCard extends StatefulWidget {
  // final BookDetails model;
  // BookCard({required this.model});
  late BookDetails model;
  BookCard(BookDetails model) {
    this.model = model;
  }

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 19, 18, 17),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LibraryBookDetails(widget.model)),
          );
        },
        child: Container(
          width: 350,
          height: 104,
          decoration: BoxDecoration(
            color: colorPrimary_light,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: colorPrimary,
                          borderRadius: BorderRadius.circular(05),
                        ),
                        child: Icon(
                          Icons.article,
                          color: colorAccentBlue,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(6.0, 4.0, 12.0, 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                                mainAxisAlignment:
                                    arabicChar(widget.model.title)
                                        ? MainAxisAlignment.center
                                        : MainAxisAlignment.start,
                                children: [
                                  arabicChar(widget.model.title)
                                      ? textWidgetRTL(widget.model.title,
                                          colorAccentGrey, 16.0)
                                      : textWidget(
                                          toTitleCase(widget.model.title),
                                          colorAccentGrey,
                                          16.0),
                                ]),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 108,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'images/users.svg',
                                          height: 16,
                                          width: 16,
                                          color: colorAccentGrey,
                                        ),
                                        SizedBox(width: 8.0),
                                        arabicChar(widget.model.author)
                                            ? textWidgetRTL(widget.model.author,
                                                colorAccentGrey, 11.0)
                                            : textWidget(
                                                toTitleCase(
                                                    widget.model.author),
                                                colorAccentGrey,
                                                11.0),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 12.0),
                              Container(
                                width: 108,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'images/sliders.svg',
                                          height: 16,
                                          width: 16,
                                          color: colorAccentGrey,
                                        ),
                                        SizedBox(width: 8.0),
                                        textWidget(
                                            widget.model.speciality != null
                                                ? widget.model.speciality
                                                    .toUpperCase()
                                                : widget.model.speciality,
                                            colorAccentGrey,
                                            11.0),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                              mainAxisAlignment:
                                  arabicChar(widget.model.subfield)
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                              children: [
                                arabicChar(widget.model.subfield)
                                    ? textWidgetRTL(widget.model.subfield,
                                        Colors.white, 14.0)
                                    : textWidget(
                                        toTitleCase(widget.model.subfield),
                                        Colors.white,
                                        14.0),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: Container(
                              width: 160,
                              decoration: BoxDecoration(
                                color: colorPrimary,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 1.0, 16, 1.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.white,
                                      size: 16.0,
                                    ),
                                    SizedBox(width: 8.0),
                                    textWidget(
                                        toTitleCase(widget.model.listing),
                                        colorAccentGrey,
                                        14.0),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
