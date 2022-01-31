import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:umtb_library/screens/LibraryHome.dart';
// import 'package:umtb_library/screens/LibraryLoading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Library());
}

class Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (context) => LibraryHome(),
        // LibraryLoading.tag: (context) => LibraryLoading(),
        LibraryHome.tag: (context) => LibraryHome(),
      },
    );
  }
}
