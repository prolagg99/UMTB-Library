import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:umtb_library/Library/model/LibraryModels.dart';
import 'package:umtb_library/Library/screen/LibraryBookDetails.dart';
import 'package:umtb_library/Library/services/database.dart';
import 'package:umtb_library/Library/utils/LibraryColors.dart';
import 'package:umtb_library/Library/utils/LibraryDataGenerator.dart';
import 'package:umtb_library/Library/utils/LibraryExtention.dart';
import 'package:umtb_library/Library/utils/LibraryImage.dart';
import 'package:umtb_library/Library/utils/LibraryWidget.dart';

class LibraryHome extends StatefulWidget {
  static String tag = '/LibraryHome';

  const LibraryHome({Key? key}) : super(key: key);
  @override
  _LibraryHomeState createState() => _LibraryHomeState();
}

class _LibraryHomeState extends State<LibraryHome> {
  final SearchBarController<BookDetails> _searchBarController =
      SearchBarController();
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<BookDetails> mListings = [];

  // bool isReplay = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _addBooks();
    });
  }

  Future<List<BookDetails>> _getALlPosts(String text) async {
    List<BookDetails> posts = mListings
        .where((element) =>
            element.title.contains(text) ||
            element.author.contains(text) ||
            element.subfield.contains(text) ||
            element.speciality.contains(text))
        .toList();
    return posts;
  }

  void _addBooks() {
    // get data from db
    mListings = getBookDetails();
    Future ft = Future(() {});

    mListings.forEach((element) {
      ft = ft.then((data) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _listKey.currentState!.insertItem(mListings.indexOf(element));
        });
      });
    });
  }

  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));
  @override
  Widget build(BuildContext context) {
    changeStatusColor(colorPrimary);
    return StreamProvider<List<BookDetails>?>.value(
      initialData: null,
      value: DatabaseService().books,
      child: Scaffold(
        backgroundColor: colorPrimary,
        body: SafeArea(
          child: SearchBar<BookDetails>(
            hintText: 'search',
            hintStyle: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
                color: Colors.grey[800]),
            icon: ic_search,
            textStyle: TextStyle(color: Colors.white),
            searchBarStyle: SearchBarStyle(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
              backgroundColor: colorPrimary_light,
              borderRadius: BorderRadius.circular(26),
            ),
            minimumChars: 1,
            searchBarPadding: EdgeInsets.symmetric(horizontal: 22),
            onSearch: _getALlPosts,
            searchBarController: _searchBarController,
            placeHolder: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: AnimatedList(
                    key: _listKey,
                    scrollDirection: Axis.vertical,
                    initialItemCount: mListings.length,
                    shrinkWrap: true,
                    itemBuilder: (context, indx, animation) {
                      return SlideTransition(
                          position: animation.drive(_offset),
                          child: BookCard(mListings[indx]));
                    }),
              ),
            ),
            cancellationWidget:
                Text("Cancel", style: TextStyle(color: colorAccentGreyIcon)),
            emptyWidget: Text("empty"), // need a modification
            // onCancelled: () {
            //   print("Cancelled triggered");
            // },
            // mainAxisSpacing: 10,
            onItemFound: (BookDetails post, int index) {
              return BookCard(post);
            },
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class BookCard extends StatefulWidget {
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
    final books = Provider.of<List<BookDetails>>(context);
    if (books != null) {
      books.forEach((element) {
        print(element.title);
        print(element.author);
        print(element.subfield);
        print(element.speciality);
        print(element.listing);
        print(element.itemID);
      });
    }
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
                                            widget.model.speciality
                                                .toUpperCase(),
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
