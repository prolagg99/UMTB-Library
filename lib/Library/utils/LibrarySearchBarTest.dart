// import 'package:flutter/material.dart';
// import 'package:flappy_search_bar/flappy_search_bar.dart';

// class Post {
//   final String title;
//   final String description;

//   Post(this.title, this.description);
// }

// String _searchText = "";
// late List names; // names we get from API
// late List filteredNames; // names filtered by search text

// class LibrarySearchBarTest extends StatelessWidget {
//   Future<List<Post>> search(String search) async {
//     await Future.delayed(Duration(seconds: 2));
//     return List.generate(search.length, (int index) {
//       return Post(
//         "Title : $search $index",
//         "Description :$search $index",
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: SearchBar<Post>(
//             onSearch: search,
//             onItemFound: (Post post, int index) {
//               return ListTile(
//                 title: Text(post.title),
//                 subtitle: Text(post.description),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// // function to use
// void _getNames() async {
//   final response = await dio.get('https://swapi.co/api/people');
//   List tempList;
//   for (int i = 0; i < response.data['results'].length; i++) {
//     tempList.add(response.data['results'][i]);
//   }

//   setState(() {
//     names = tempList;
//     filteredNames = names;
//   });
// }

// Widget _buildList() {
//   if (!(_searchText.isEmpty)) {
//     List tempList;
//     for (int i = 0; i < filteredNames.length; i++) {
//       if (filteredNames[i]['name']
//           .toLowerCase()
//           .contains(_searchText.toLowerCase())) {
//         tempList.add(filteredNames[i]);
//       }
//     }
//     filteredNames = tempList;
//   }
//   return ListView.builder(
//     itemCount: names == null ? 0 : filteredNames.length,
//     itemBuilder: (BuildContext context, int index) {
//       return new ListTile(
//         title: Text(filteredNames[index]['name']),
//         onTap: () => print(filteredNames[index]['name']),
//       );
//     },
//   );
// }
