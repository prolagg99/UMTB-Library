import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umtb_library/Library/model/LibraryModels.dart';
import 'package:umtb_library/Library/utils/LibraryExtention.dart';

class GetDocuments {
  final CollectionReference bookCollection =
      FirebaseFirestore.instance.collection('booksJson');
  List<BookDetails> listAllDocument = [];

// get all data from db to search elements
  Future<void> getAllDocuments() async {
    bookCollection.get().then((value) {
      return value.docs.forEach((doc) {
        print('getDocuments ${doc.data()}');
        listAllDocument.add(
          BookDetails(
            author: doc.data().toString().contains('Author')
                ? toLowerCase(doc.get('Author'))
                : '',
            listing: doc.data().toString().contains('Listing')
                ? toLowerCase(doc.get('Listing'))
                : '',
            speciality: doc.data().toString().contains('Speciality')
                ? toLowerCase(doc.get('Speciality'))
                : '',
            subfield: doc.data().toString().contains('Subfield')
                ? toLowerCase(doc.get('Subfield'))
                : '',
            title: doc.data().toString().contains('Title')
                ? toLowerCase(doc.get('Title'))
                : '',
          ),
        );
      });
    });
  }
}
