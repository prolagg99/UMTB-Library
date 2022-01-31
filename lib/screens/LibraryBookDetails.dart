import 'package:flutter/material.dart';
import 'package:umtb_library/model/LibraryModels.dart';
import 'package:umtb_library/utils/colors.dart';
import 'package:umtb_library/utils/images.dart';
import 'package:umtb_library/utils/widget.dart';

class LibraryBookDetails extends StatefulWidget {
  static String tag = '/LibraryBookDetails';

  final BookDetails model;
  const LibraryBookDetails(this.model);

  @override
  State<LibraryBookDetails> createState() => _LibraryBookDetailsState();
}

class _LibraryBookDetailsState extends State<LibraryBookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorPrimary,
      appBar: appBar(context),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              child: Container(
                width: 350,
                height: 536,
                decoration: BoxDecoration(
                  color: colorPrimary_light,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 0.0),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: bookContainer(ic_open_book, 'title: ',
                              widget.model.title, Colors.white, 20.0)),
                      Expanded(
                          flex: 1,
                          child: bookContainer(ic_users, 'author: ',
                              widget.model.author, Colors.white, 17.0)),
                      Expanded(
                          flex: 1,
                          child: bookContainer(ic_subfield, 'subfiled: ',
                              widget.model.subfield, Colors.white, 17.0)),
                      Expanded(
                          flex: 1,
                          child: bookContainer(ic_speciality, 'speciality: ',
                              widget.model.speciality, Colors.white, 17.0)),
                      Expanded(
                          flex: 1,
                          child: bookContainer(ic_file_search, 'listing: ',
                              widget.model.listing, colorAccentGreen, 28.0)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
