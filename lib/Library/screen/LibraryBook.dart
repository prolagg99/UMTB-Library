import 'package:flutter/material.dart';
import 'package:umtb_library/Library/utils/LibraryColors.dart';
import 'package:umtb_library/Library/utils/LibraryImage.dart';
import 'package:umtb_library/Library/utils/LibraryWidget.dart';

class LibraryBook extends StatelessWidget {
  const LibraryBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 350,
                height: 536,
                decoration: BoxDecoration(
                  color: colorPrimary_light,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 24.0),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: bookContainer(ic_open_book, 'title: ',
                              'maxon cinéma 4d 7.0', Colors.white, 20.0)),
                      Expanded(
                          flex: 1,
                          child: bookContainer(ic_users, 'author: ',
                              'pierre laszlo', Colors.white, 20.0)),
                      Expanded(
                          flex: 1,
                          child: bookContainer(ic_subfield, 'subfiled: ',
                              'biochimie', Colors.white, 20.0)),
                      Expanded(
                          flex: 1,
                          child: bookContainer(ic_speciality, 'speciality: ',
                              'biologie', Colors.white, 20.0)),
                      Expanded(
                          flex: 1,
                          child: bookContainer(ic_file_search, 'listing: ',
                              '574.19/70', colorAccentGreen, 26.0)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
