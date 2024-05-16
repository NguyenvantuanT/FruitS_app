// import 'package:flutter/material.dart';
// import 'package:nectar/models/fruit_model.dart';
// import 'package:nectar/themes/colors.dart';

// class SearchBarApp extends StatefulWidget {
//   const SearchBarApp({super.key});

//   @override
//   State<SearchBarApp> createState() => _SearchBarAppState();
// }

// class _SearchBarAppState extends State<SearchBarApp> {
//   final SearchController searchController = SearchController();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Search Bar Sample')),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SearchAnchor(
//             builder: (BuildContext context, SearchController searchController) {
//               return SearchBar(
//                  constraints: BoxConstraints(
//                   maxHeight: 100,
//                 ),
//                 shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
//                 surfaceTintColor: MaterialStateProperty.all<Color>(Colors.white),
//                 overlayColor: MaterialStateProperty.all<Color>(Colors.white),
//                 backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                 controller: searchController,
//                 hintText: 'Search Store',
//                 hintStyle: MaterialStateProperty.all(
//                   const TextStyle(color: Colors.grey),
//                 ),
//                 padding: const MaterialStatePropertyAll<EdgeInsets>(
//                   EdgeInsets.symmetric(horizontal: 16.0),
//                 ),
//                 onTap: () {
//                   searchController.openView();
//                 },
//                 onChanged: (_) {
//                   searchController.openView();
//                 },
//                 leading: const Icon(
//                   Icons.search,
//                   color: AppColor.red,
//                 ),
//               );
//             },
//             suggestionsBuilder:
//                 (BuildContext context, SearchController controller) {
//               final List<FruitModel> suggestions =
//                   _getSuggestions(controller.text);
//               return List<ListTile>.generate(suggestions.length, (int index) {
//                 final item = suggestions[index];
//                 return ListTile(
//                   tileColor: Colors.white,
//                   leading: Image.asset(item.img ?? ''),
//                   title: Text(item.name ?? ''),
//                   onTap: () {
//                     setState(() {});
//                   },
//                 );
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   List<FruitModel> _getSuggestions(String query) {
//     final List<FruitModel> allItems = [...fruits];

//     return allItems.where((item) {
//       return (item.name ?? '').toLowerCase().contains(query.toLowerCase());
//     }).toList();
//   }
// }
