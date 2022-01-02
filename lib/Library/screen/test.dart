import 'package:flutter/material.dart';
import 'package:umtb_library/Library/utils/LibraryColors.dart';
import 'package:umtb_library/Library/utils/LibraryExtention.dart';
import 'package:umtb_library/Library/utils/LibraryImage.dart';
import 'package:google_fonts/google_fonts.dart';

class LibraryHome extends StatefulWidget {
  const LibraryHome({Key? key}) : super(key: key);
  static String tag = '/LibraryHome';

  @override
  _LibraryHomeState createState() => _LibraryHomeState();
}

class _LibraryHomeState extends State<LibraryHome> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(colorPrimary);
    return Scaffold(
      backgroundColor: colorPrimary,
      // appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 350,
                height: 48,
                decoration: BoxDecoration(
                  color: colorPrimary_light,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 0.0),
                  child: Row(
                    children: [
                      ic_search,
                      SizedBox(width: 5.0),
                      Text(
                        'search',
                        style: GoogleFonts.montserrat(color: colorAccentGrey),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 42),
              Container(
                width: 350,
                height: 100,
                decoration: BoxDecoration(
                  color: colorPrimary_light,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      // color: Colors.white,
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
                                // size: 16.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        // color: Colors.red,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(6.0, 6.0, 12.0, 6.0),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  // color: Colors.green,
                                  child: Row(children: [
                                    Flexible(
                                      child: Align(
                                        // alignment: Alignment.centerRight,
                                        child: Text(
                                            'Climatologie Et Temps Phisique AtomiquePhisique Atomique',
                                            // ' الرياضيات الرياضيات الرياضيات ',
                                            overflow: TextOverflow.ellipsis,
                                            // textDirection: TextDirection.rtl,
                                            style: GoogleFonts.montserrat(
                                              color: colorAccentGrey,
                                              fontSize: 16.0,
                                              // fontWeight: FontWeight.w500,
                                            )),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 106,
                                      // color: Colors.blue,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.person,
                                                  color: colorAccentGrey,
                                                  size: 20.0),
                                              SizedBox(
                                                width: 8.0,
                                              ),
                                              Flexible(
                                                child: Text(
                                                  'alain char',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.montserrat(
                                                    color: colorAccentGrey,
                                                    fontSize: 11.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 14.0),
                                    Container(
                                      width: 106,
                                      // color: Colors.green,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.person,
                                                  color: colorAccentGrey,
                                                  size: 20.0),
                                              SizedBox(
                                                width: 8.0,
                                              ),
                                              Flexible(
                                                child: Text('ELECTRONIC',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color: colorAccentGrey,
                                                      fontSize: 11.0,
                                                    )),
                                              ),
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
                                  // color: Colors.yellow,
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'Phisique Atomique Phisique AtomiquePhisique AtomiquePhisique Atomique',
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(children: [
                                  Container(
                                      width: 160,
                                      decoration: BoxDecoration(
                                        color: colorPrimary,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 1.0, 16, 1.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.white,
                                              size: 16.0,
                                            ),
                                            SizedBox(width: 8.0),
                                            Flexible(
                                              child: Text('330/64',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.montserrat(
                                                      color: colorAccentGrey)),
                                            ),
                                          ],
                                        ),
                                      ))
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 42),
              Container(
                width: 350,
                height: 100,
                decoration: BoxDecoration(
                  color: colorPrimary_light,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              SizedBox(height: 42),
              Container(
                width: 350,
                height: 100,
                decoration: BoxDecoration(
                  color: colorPrimary_light,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
