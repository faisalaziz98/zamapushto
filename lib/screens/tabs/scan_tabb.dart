// ignore_for_file: unnecessary_null_comparison, unnecessary_import, library_private_types_in_public_api

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tesseract_ocr/android_ios.dart';
import 'package:pushto/screens/widgets/scan_item.dart';

import '../result_page.dart';
import '../widgets/tab_widgets/scan_listview_item.dart';

class ScanTab extends StatefulWidget {
  final Uint8List croppedImage;

  const ScanTab({Key? key, required this.croppedImage}) : super(key: key);

  @override
  _ScanTabState createState() => _ScanTabState();
}

class _ScanTabState extends State<ScanTab> {
  bool isGridView = true;
  String ocrText = '';

  void _fetchTextFromImage(
      {required String imagePath,
      required String imageName,
      required String language}) async {
    FlutterTesseractOcr.extractText(imagePath, language: language)
        .then((value) {
      setState(() {
        ocrText = value;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              convertedText: ocrText,
              imageBytes: widget.croppedImage,
            ),
          ),
        );
      });
    }).catchError((error) {
      setState(() {
        if (kDebugMode) {
          print('error');
        }
        ocrText = error.toString();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              convertedText: ocrText,
              imageBytes: widget.croppedImage,
            ),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('View:'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isGridView = false;
                    });
                  },
                  icon: const Icon(Icons.list),
                  color: isGridView ? Colors.grey : Colors.black,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isGridView = true;
                    });
                  },
                  icon: const Icon(Icons.grid_view),
                  color: isGridView ? Colors.black : Colors.grey,
                ),
              ],
            ),
            Expanded(
              child: isGridView
                  ? GridView.count(
                      crossAxisCount: 2,
                      padding: const EdgeInsets.all(8),
                      children: [
                        InkWell(
                          onTap: () {
                            if (widget.croppedImage == null) {
                              return;
                            }

                            Directory tempDir = Directory.systemTemp;
                            String imagePath = '${tempDir.path}/temp.jpg';
                            File imageFile = File(imagePath);
                            imageFile.writeAsBytesSync(widget.croppedImage);

                            _fetchTextFromImage(
                              imagePath: imagePath,
                              imageName: 'temp',
                              language: 'pus',
                            );
                          },
                          child: ScanItem(
                            photoName: 'Photo 1',
                            timeAgo: DateTime.now(),
                            image: widget.croppedImage,
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: InkWell(
                            onTap: () {
                              if (widget.croppedImage == null) {
                                return;
                              }

                              Directory tempDir = Directory.systemTemp;
                              String imagePath = '${tempDir.path}/temp.jpg';
                              File imageFile = File(imagePath);
                              imageFile.writeAsBytesSync(widget.croppedImage);

                              _fetchTextFromImage(
                                imagePath: imagePath,
                                imageName: 'temp',
                                language: 'pus',
                              );
                            },
                            child: ScanItemListView(
                              photoName: 'Photo 1',
                              timeAgo: DateTime.now(),
                              image: widget.croppedImage,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// // ignore_for_file: library_private_types_in_public_api

// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
// import 'package:pushto/screens/result_page.dart';
// import 'package:pushto/screens/widgets/tab_widgets/scan_listview_item.dart';

// import '../widgets/scan_item.dart';

// class ScanTab extends StatefulWidget {
//   final Uint8List croppedImage;

//   const ScanTab({Key? key, required this.croppedImage}) : super(key: key);

//   @override
//   _ScanTabState createState() => _ScanTabState();
// }

// class _ScanTabState extends State<ScanTab> {
//   String ocrText = '';
//   bool isGridView = true;

//   void _fetchTextFromImage(
//       {required String imagePath,
//       required String imageName,
//       required String language}) async {
//     FlutterTesseractOcr.extractText(imagePath, language: language)
//         .then((value) {
//       setState(() {
//         ocrText = value;
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ResultPage(
//               convertedText: ocrText,
//               imageBytes: widget.croppedImage!,
//             ),
//           ),
//         );
//       });
//     }).catchError((error) {
//       setState(() {
//         if (kDebugMode) {
//           print('error');
//         }
//         ocrText = error.toString();
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ResultPage(
//               convertedText: ocrText,
//               imageBytes: widget.croppedImage!,
//             ),
//           ),
//         );
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             (widget.croppedImage == null)
//                 ? const SizedBox.shrink()
//                 : InkWell(
//                     onTap: () {
//                       if (widget.croppedImage == null) {
//                         return;
//                       }

//                       Directory tempDir = Directory.systemTemp;
//                       String imagePath = '${tempDir.path}/temp.jpg';
//                       File imageFile = File(imagePath);
//                       imageFile.writeAsBytesSync(widget.croppedImage!);

//                       _fetchTextFromImage(
//                         imagePath: imagePath,
//                         imageName: 'temp',
//                         language: 'pus',
//                       );
//                     },
//                     child: Expanded(
//                       child: isGridView
//                           ? GridView.count(
//                               crossAxisCount: 2,
//                               padding: const EdgeInsets.all(8),
//                               children: [
//                                 ScanItem(
//                                   photoName: 'Photo 1',
//                                   timeAgo: '3 hours ago',
//                                   image: widget.croppedImage,
//                                 ),
//                               ],
//                             )
//                           : ListView.builder(
//                               padding: const EdgeInsets.all(8),
//                               itemCount: 1,
//                               itemBuilder: (context, index) {
//                                 return Padding(
//                                   padding:
//                                       const EdgeInsets.symmetric(vertical: 8),
//                                   child: ScanItemListView(
//                                     photoName: 'Photo 1',
//                                     timeAgo: '3 hours ago',
//                                     image: widget.croppedImage,
//                                   ),
//                                 );
//                               },
//                             ),
//                     ), // child: Card(
//                     //   elevation: 2,
//                     //   shape: RoundedRectangleBorder(
//                     //     side: const BorderSide(color: Colors.grey, width: 1),
//                     //     borderRadius: BorderRadius.circular(10),
//                     //   ),
//                     //   child: Container(
//                     //     height: 150,
//                     //     width: 150,
//                     //     decoration: BoxDecoration(
//                     //       color: const Color(0XFF00C4E6),
//                     //       borderRadius: BorderRadius.circular(10),
//                     //     ),
//                     //     child: Image.memory(
//                     //       widget.croppedImage!,
//                     //       fit: BoxFit.fill,
//                     //     ),
//                     //   ),
//                     // ),
//                   ),
//             // const Text(
//             //   'Process',
//             //   style: TextStyle(color: Colors.blue),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
