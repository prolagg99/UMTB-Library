import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // collection reference
  final CollectionReference bookCollection =
      FirebaseFirestore.instance.collection('booksJson');

  // get books stream
  Stream<QuerySnapshot> get books {
    return bookCollection.snapshots();
  }
}
