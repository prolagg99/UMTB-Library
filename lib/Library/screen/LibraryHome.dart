import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umtb_library/Library/model/LibraryModels.dart';
import 'package:umtb_library/Library/screen/LibraryBookDetails.dart';
import 'package:umtb_library/Library/utils/LibraryColors.dart';
import 'package:umtb_library/Library/utils/LibraryConstant.dart';
import 'package:umtb_library/Library/utils/LibraryDataGenerator.dart';
import 'package:umtb_library/Library/utils/LibraryExtention.dart';
import 'package:umtb_library/Library/utils/LibraryImage.dart';
import 'package:umtb_library/Library/utils/LibraryWidget.dart';

class LibraryHome extends StatefulWidget {
  const LibraryHome({Key? key}) : super(key: key);
  static String tag = '/LibraryHome';

  @override
  _LibraryHomeState createState() => _LibraryHomeState();
}

class _LibraryHomeState extends State<LibraryHome> {
  late List<BookDetails> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getBookDetails();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(colorPrimary);
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: 350,
              height: 76,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 20.0),
                child: Container(
                  width: 350,
                  height: 28,
                  decoration: BoxDecoration(
                    color: colorPrimary_light,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        ic_search,
                        SizedBox(width: 5.0),
                        Text('search',
                            style: TextStyle(
                                fontFamily: fontRegular,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey[800]))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mListings.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return BookCard(mListings[index]);
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  late BookDetails model;
  BookCard(BookDetails model) {
    this.model = model;
  }
  final arabicCharExp = RegExp("^[\u0621-\u064A]", unicode: true);
  bool arabicChar(String str) {
    return arabicCharExp.hasMatch(str);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 19, 18, 17),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LibraryBookDetails()),
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
                                mainAxisAlignment: arabicChar(model.title)
                                    ? MainAxisAlignment.center
                                    : MainAxisAlignment.start,
                                children: [
                                  arabicChar(model.title)
                                      ? textWidgetRTL(toTitleCase(model.title),
                                          colorAccentGrey, 16.0)
                                      : textWidget(toTitleCase(model.title),
                                          colorAccentGrey, 16.0),
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
                                        arabicChar(model.author)
                                            ? textWidgetRTL(
                                                toTitleCase(model.author),
                                                colorAccentGrey,
                                                11.0)
                                            : textWidget(
                                                toTitleCase(model.author),
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
                                            model.speciality.toUpperCase(),
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
                              mainAxisAlignment: arabicChar(model.subfield)
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                arabicChar(model.subfield)
                                    ? textWidgetRTL(toTitleCase(model.subfield),
                                        Colors.white, 14.0)
                                    : textWidget(toTitleCase(model.subfield),
                                        Colors.white, 14.0),
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
                                    textWidget(toTitleCase(model.listing),
                                        colorAccentGrey, 14.0),
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


// RTL Widget
    // Container(
              //   width: 350,
              //   height: 100,
              //   decoration: BoxDecoration(
              //     color: colorPrimary_light,
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child: Row(
              //     children: <Widget>[
              //       Container(
              //         // color: Colors.white,
              //         child: Column(
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
              //               child: Container(
              //                 width: 40.0,
              //                 height: 40.0,
              //                 decoration: BoxDecoration(
              //                   color: colorPrimary,
              //                   borderRadius: BorderRadius.circular(05),
              //                 ),
              //                 child: Icon(
              //                   Icons.article,
              //                   color: colorAccentBlue,
              //                 ),
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //       Expanded(
              //         flex: 1,
              //         child: Container(
              //           // color: Colors.red,
              //           child: Padding(
              //             padding:
              //                 const EdgeInsets.fromLTRB(6.0, 4.0, 12.0, 4.0),
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Expanded(
              //                   flex: 1,
              //                   child: Container(
              //                     // color: Colors.green,
              //                     child: Row(
              //                         mainAxisAlignment:
              //                             MainAxisAlignment.center,
              //                         children: [
              //                           textWidgetRTL('إدارة الأعمال',
              //                               colorAccentGrey, 16.0)
              //                         ]),
              //                   ),
              //                 ),
              //                 Expanded(
              //                   flex: 0,
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     children: [
              //                       Container(
              //                         width: 108,
              //                         // color: Colors.blue,
              //                         child: Column(
              //                           children: [
              //                             Row(
              //                               children: [
              //                                 SvgPicture.asset(
              //                                   'images/users.svg',
              //                                   height: 16,
              //                                   width: 16,
              //                                   color: colorAccentGrey,
              //                                 ),
              //                                 SizedBox(width: 8.0),
              //                                 textWidgetRTL('محمد الصيرفي',
              //                                     colorAccentGrey, 11.5),
              //                               ],
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       SizedBox(width: 12.0),
              //                       Container(
              //                         width: 108,
              //                         // color: Colors.green,
              //                         child: Column(
              //                           children: [
              //                             Row(
              //                               children: [
              //                                 SvgPicture.asset(
              //                                   'images/sliders.svg',
              //                                   height: 16,
              //                                   width: 16,
              //                                   color: colorAccentGrey,
              //                                 ),
              //                                 SizedBox(width: 8.0),
              //                                 textWidget(
              //                                     'economic'.toUpperCase(),
              //                                     colorAccentGrey,
              //                                     11.5),
              //                               ],
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 Expanded(
              //                   flex: 1,
              //                   child: Container(
              //                     // color: Colors.yellow,
              //                     child: Row(
              //                       mainAxisAlignment: MainAxisAlignment.end,
              //                       children: [
              //                         textWidgetRTL('التنسيق الإداري',
              //                             Colors.white, 14.0),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //                 Expanded(
              //                   flex: 0,
              //                   child: Container(
              //                       width: 160,
              //                       decoration: BoxDecoration(
              //                         color: colorPrimary,
              //                         borderRadius: BorderRadius.circular(15),
              //                       ),
              //                       child: Padding(
              //                         padding: const EdgeInsets.fromLTRB(
              //                             16, 1.0, 16, 1.0),
              //                         child: Row(
              //                           children: [
              //                             Icon(
              //                               Icons.check_circle,
              //                               color: Colors.white,
              //                               size: 16.0,
              //                             ),
              //                             SizedBox(width: 8.0),
              //                             textWidget(
              //                                 '330/64', colorAccentGrey, 14.0),
              //                           ],
              //                         ),
              //                       )),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
