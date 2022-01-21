import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umtb_library/Library/model/LibraryModels.dart';

class DatabaseService {
  // collection reference
  final CollectionReference bookCollection =
      FirebaseFirestore.instance.collection('booksJson');

  // book list from snapshot
  List<BookDetails> _getBookListFromSnapshot(QuerySnapshot? snapshot) {
    return snapshot!.docs.map((doc) {
      //print(doc.data);
      return BookDetails(
        author:
            doc.data().toString().contains('Author') ? doc.get('Author') : '',
        listing:
            doc.data().toString().contains('Listing') ? doc.get('Listing') : '',
        speciality: doc.data().toString().contains('Speciality')
            ? doc.get('Speciality')
            : '',
        subfield: doc.data().toString().contains('Subfield')
            ? doc.get('Subfield')
            : '',
        title: doc.data().toString().contains('Title') ? doc.get('Title') : '',
        itemID:
            doc.data().toString().contains('itemId') ? doc.get('itemId') : '',
      );
    }).toList();
  }

  // get books stream
  Stream<List<BookDetails>> get books {
    return bookCollection.snapshots().map(_getBookListFromSnapshot);
  }
}
