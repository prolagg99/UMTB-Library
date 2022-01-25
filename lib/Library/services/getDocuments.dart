// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:umtb_library/Library/model/LibraryModels.dart';

// class GetDocuments {
//   final CollectionReference bookCollection =
//       FirebaseFirestore.instance.collection('booksJson');
//   List<BookDetails> listAllDocument = [];

// // get all data from db to search elements
//   Future<void> getAllDocuments() async {
//     bookCollection.get().then((value) {
//       // snapshot = value; // store collection state to set where to start next
//       return value.docs.forEach((doc) {
//         print('getDocuments ${doc.data()}');
//         listAllDocument.add(
//           BookDetails(
//             author: doc.data().toString().contains('Author')
//                 ? doc.get('Author')
//                 : '',
//             listing: doc.data().toString().contains('Listing')
//                 ? doc.get('Listing')
//                 : '',
//             speciality: doc.data().toString().contains('Speciality')
//                 ? doc.get('Speciality')
//                 : '',
//             subfield: doc.data().toString().contains('Subfield')
//                 ? doc.get('Subfield')
//                 : '',
//             title:
//                 doc.data().toString().contains('Title') ? doc.get('Title') : '',
//           ),
//         );
//       });
//     });
//   }

//   List<BookDetails> listOfDocument = [];
//   late QuerySnapshot snapshot;

// // Fetch first 15 documents
//   Future<void> getDocuments() async {
//     var collection = bookCollection.limit(10);
//     print('getDocuments');
//     fetchDocuments(collection);
//   }

// // Fetch next 5 documents starting from the last document fetched earlier
//   Future<void> getDocumentsNext() async {
//     // Get the last visible document
//     var lastVisible = snapshot.docs[snapshot.docs.length - 1];
//     print('listDocument legnth: ${snapshot.size} last: $lastVisible');
//     var collection = bookCollection.startAfterDocument(lastVisible).limit(5);
//     fetchDocuments(collection);
//   }

//   fetchDocuments(Query collection) {
//     collection.get().then((value) {
//       snapshot = value; // store collection state to set where to start next
//       value.docs.forEach((doc) {
//         print('getDocuments ${doc.data()}');
//         // setState(() {
//         listOfDocument.add(
//           BookDetails(
//             author: doc.data().toString().contains('Author')
//                 ? doc.get('Author')
//                 : '',
//             listing: doc.data().toString().contains('Listing')
//                 ? doc.get('Listing')
//                 : '',
//             speciality: doc.data().toString().contains('Speciality')
//                 ? doc.get('Speciality')
//                 : '',
//             subfield: doc.data().toString().contains('Subfield')
//                 ? doc.get('Subfield')
//                 : '',
//             title:
//                 doc.data().toString().contains('Title') ? doc.get('Title') : '',
//           ),
//         );
//         // });
//       });
//     });
//   }
// }
