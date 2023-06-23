import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:pushto/screens/translation_page.dart';

class ResultPage extends StatelessWidget {
  final String convertedText;

  const ResultPage({
    Key? key,
    required this.convertedText,
    required Uint8List imageBytes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Scan Result '),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading:
            false, // Hide the back button provided by AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle three dot icon press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.circular(20)),
                    width: 35,
                    height: 35,
                    child: const Icon(Icons.speaker_notes),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 100,
                    height: 35,
                    decoration: BoxDecoration(
                        color: const Color(0xFFD6F7FC),
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Pushto',
                          style: TextStyle(color: Colors.black),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TranslationPage(
                            tText: convertedText,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 120,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Translate',
                            style: TextStyle(color: Colors.black),
                          ),
                          Icon(
                            Icons.translate,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Converted Text:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          FlutterClipboard.copy(convertedText).then((result) {
                            const snackBar = SnackBar(
                              content: Text('Copied to clipboard'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          });
                        },
                        icon: const Icon(Icons.copy),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    convertedText,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:pushto/screens/translation_page.dart';

// class ResultPage extends StatelessWidget {
//   final String convertedText;

//   const ResultPage({
//     super.key,
//     required this.convertedText,
//     required Uint8List imageBytes,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Scan Result '),
//         elevation: 0,
//         backgroundColor: Theme.of(context).primaryColor,
//         automaticallyImplyLeading:
//             false, // Hide the back button provided by AppBar
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             // Handle back button press
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.more_vert),
//             onPressed: () {
//               // Handle three dot icon press
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 120,
//             decoration: BoxDecoration(
//               color: Theme.of(context).primaryColor,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Theme.of(context).canvasColor,
//                         borderRadius: BorderRadius.circular(20)),
//                     width: 35,
//                     height: 35,
//                     child: const Icon(Icons.speaker_notes),
//                   ),
//                   const SizedBox(width: 10),
//                   Container(
//                     width: 100,
//                     height: 35,
//                     decoration: BoxDecoration(
//                         color: const Color(0xFFD6F7FC),
//                         borderRadius: BorderRadius.circular(20)),
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     child: const Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Text(
//                           'Pushto',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         Icon(
//                           Icons.arrow_drop_down,
//                           color: Colors.black,
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Spacer(),
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => TranslationPage(
//                                     tText: convertedText,
//                                   )));
//                     },
//                     child: Container(
//                       width: 120,
//                       height: 35,
//                       decoration: BoxDecoration(
//                           color: Theme.of(context).canvasColor,
//                           borderRadius: BorderRadius.circular(20)),
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text(
//                             'Translate',
//                             style: TextStyle(color: Colors.black),
//                           ),
//                           Icon(
//                             Icons.translate,
//                             color: Colors.black,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(vertical: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Converted Text:',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       IconButton(onPressed: () {}, icon: const Icon(Icons.copy))
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     convertedText,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Add other content for the ResultPage here
//         ],
//       ),
//     );
//   }
// }