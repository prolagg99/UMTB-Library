import 'package:flutter/material.dart';
import 'package:umtb_library/Library/model/LibraryModels.dart';
import 'package:umtb_library/Library/utils/LibraryColors.dart';
import 'package:umtb_library/Library/utils/LibraryDataGenerator.dart';
import 'package:umtb_library/Library/utils/LibraryImage.dart';
import 'package:umtb_library/Library/utils/LibraryWidget.dart';

class LibraryBookDetails extends StatefulWidget {
  const LibraryBookDetails({Key? key}) : super(key: key);
  static String tag = '/LibraryBookDetails';

  @override
  State<LibraryBookDetails> createState() => _LibraryBookDetailsState();
}

class _LibraryBookDetailsState extends State<LibraryBookDetails> {
  late List<BookDetails> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getBookDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              mListings[0].title, Colors.white, 20.0)),
                      Expanded(
                          flex: 1,
                          child: bookContainer(ic_users, 'author: ',
                              mListings[0].author, Colors.white, 17.0)),
                      Expanded(
                          flex: 1,
                          child: bookContainer(ic_subfield, 'subfiled: ',
                              mListings[0].subfield, Colors.white, 17.0)),
                      Expanded(
                          flex: 1,
                          child: bookContainer(ic_speciality, 'speciality: ',
                              mListings[0].speciality, Colors.white, 17.0)),
                      Expanded(
                          flex: 1,
                          child: bookContainer(ic_file_search, 'listing: ',
                              mListings[0].listing, colorAccentGreen, 28.0)),
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
