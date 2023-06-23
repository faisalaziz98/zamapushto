// // ignore_for_file: library_private_types_in_public_api

// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:pushto/screens/widgets/scan_item.dart';

// import '../widgets/tab_widgets/scan_listview_item.dart';

// class ScanTab extends StatefulWidget {
//   final Uint8List croppedImage;

//   const ScanTab({Key? key, required this.croppedImage}) : super(key: key);

//   @override
//   _ScanTabState createState() => _ScanTabState();
// }

// class _ScanTabState extends State<ScanTab> {
//   bool isGridView = true;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//         ),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 const Text('View:'),
//                 IconButton(
//                   onPressed: () {
//                     setState(() {
//                       isGridView = false;
//                     });
//                   },
//                   icon: const Icon(Icons.list),
//                   color: isGridView ? Colors.grey : Colors.black,
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     setState(() {
//                       isGridView = true;
//                     });
//                   },
//                   icon: const Icon(Icons.grid_view),
//                   color: isGridView ? Colors.black : Colors.grey,
//                 ),
//               ],
//             ),
//             Expanded(
//               child: isGridView
//                   ? GridView.count(
//                       crossAxisCount: 2,
//                       padding: const EdgeInsets.all(8),
//                       children: [
//                         ScanItem(
//                           photoName: 'Photo 1',
//                           timeAgo: DateTime.now(),
//                           image: widget.croppedImage,
//                         ),
//                       ],
//                     )
//                   : ListView.builder(
//                       padding: const EdgeInsets.all(8),
//                       itemCount: 1,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8),
//                           child: ScanItemListView(
//                             photoName: 'Photo 1',
//                             timeAgo: DateTime.now(),
//                             image: widget.croppedImage,
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
