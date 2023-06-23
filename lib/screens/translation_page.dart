import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:pushto/screens/widgets/language_selector_container.dart';
import 'package:pushto/screens/widgets/translation_container.dart';
import 'package:translator/translator.dart';

class TranslationPage extends StatefulWidget {
  final String tText;

  const TranslationPage({Key? key, required this.tText}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TranslationPageState createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  String translatedText = '';

  void translateText() async {
    final translator = GoogleTranslator();

    Translation translation = await translator.translate(
      widget.tText,
      to: 'en',
    );

    setState(() {
      translatedText = translation.text;
    });
  }

  @override
  void initState() {
    super.initState();
    translateText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Scan Result'),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LanguageSelectorContainer(
                    language: 'Pushto',
                    icon: Icons.arrow_drop_down,
                    backgroundColor: const Color(0xFFD6F7FC),
                    onTap: () {
                      translateText();
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 35,
                    height: 35,
                    child: const Icon(Icons.arrow_forward),
                  ),
                  LanguageSelectorContainer(
                    language: 'English',
                    icon: Icons.arrow_drop_down,
                    backgroundColor: const Color(0xFFD6F7FC),
                    onTap: () {
                      translateText();
                    },
                  ),
                ],
              ),
            ),
            TranslationContainer(
              onpressed: () {
                FlutterClipboard.copy(widget.tText).then((result) {
                  const snackBar = SnackBar(
                    content: Text('Copied to clipboard'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
              },
              textAlign: TextAlign.right,
              language: 'Pushto',
              icon: Icons.arrow_drop_down,
              text: widget.tText,
            ),
            const SizedBox(height: 10),
            TranslationContainer(
              onpressed: () {
                FlutterClipboard.copy(translatedText).then((result) {
                  const snackBar = SnackBar(
                    content: Text('Copied to clipboard'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
              },
              textAlign: TextAlign.left,
              language: 'English',
              icon: Icons.arrow_drop_down,
              text: translatedText,
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:pushto/screens/widgets/language_selector_container.dart';
// import 'package:pushto/screens/widgets/translation_container.dart';
// import 'package:translator/translator.dart';

// class TranslationPage extends StatefulWidget {
//   final String tText;

//   const TranslationPage({Key? key, required this.tText}) : super(key: key);

//   @override
//   _TranslationPageState createState() => _TranslationPageState();
// }

// class _TranslationPageState extends State<TranslationPage> {
//   String translatedText = '';

//   void translateText() async {
//     final translator = GoogleTranslator();

//     Translation translation = await translator.translate(
//       widget.tText,
//       to: 'en',
//     );

//     setState(() {
//       translatedText = translation.text;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     translateText();
//   }
//   // String translatedText = '';

//   // void translateText(String language) async {
//   //   final translator = GoogleTranslator();

//   //   Translation translation = await translator.translate(
//   //     widget.tText,
//   //     from: 'auto',
//   //     to: language,
//   //   );

//   //   setState(() {
//   //     translatedText = translation.text;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Scan Result'),
//         elevation: 0,
//         backgroundColor: Theme.of(context).primaryColor,
//         automaticallyImplyLeading: false,
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
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 100,
//               decoration: BoxDecoration(
//                 color: Theme.of(context).primaryColor,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   LanguageSelectorContainer(
//                     language: 'Pushto',
//                     icon: Icons.arrow_drop_down,
//                     backgroundColor: const Color(0xFFD6F7FC),
//                     onTap: () {
//                       translateText();
//                     },
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).canvasColor,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     width: 35,
//                     height: 35,
//                     child: const Icon(Icons.arrow_forward),
//                   ),
//                   LanguageSelectorContainer(
//                     language: 'English',
//                     icon: Icons.arrow_drop_down,
//                     backgroundColor: const Color(0xFFD6F7FC),
//                     onTap: () {
//                       translateText();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             TranslationContainer(
//               onpressed: (){},
//               textAlign: TextAlign.right,
//               language: 'Pushto',
//               icon: Icons.arrow_drop_down,
//               text: widget.tText,
//             ),
//             const SizedBox(height: 10),
//             TranslationContainer(
//               onpressed: (){},
//               textAlign: TextAlign.left,
//               language: 'English',
//               icon: Icons.arrow_drop_down,
//               text: translatedText,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:pushto/screens/widgets/language_selector_container.dart';
// import 'package:pushto/screens/widgets/translation_container.dart';

// class TranslationPage extends StatelessWidget {
//   final String tText;
//   const TranslationPage({super.key, required this.tText});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Scan Result'),
//         elevation: 0,
//         backgroundColor: Theme.of(context).primaryColor,
//         automaticallyImplyLeading: false,
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
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 100,
//               decoration: BoxDecoration(
//                 color: Theme.of(context).primaryColor,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   const LanguageSelectorContainer(
//                     language: 'Pushto',
//                     icon: Icons.arrow_drop_down,
//                     backgroundColor: Color(0xFFD6F7FC),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Theme.of(context).canvasColor,
//                         borderRadius: BorderRadius.circular(20)),
//                     width: 35,
//                     height: 35,
//                     child: const Icon(Icons.arrow_forward),
//                   ),
//                   const LanguageSelectorContainer(
//                     language: 'English',
//                     icon: Icons.arrow_drop_down,
//                     backgroundColor: Color(0xFFD6F7FC),
//                   ),
//                 ],
//               ),
//             ),
//             TranslationContainer(
//               textAlign: TextAlign.right,
//               language: 'Pushto',
//               icon: Icons.arrow_drop_down,
//               text: tText,
//             ),
//             const SizedBox(height: 10),
//             const TranslationContainer(
//                 textAlign: TextAlign.left,
//                 language: 'English',
//                 icon: Icons.arrow_drop_down,
//                 text: 'tText in english'),
//           ],
//         ),
//       ),
//     );
//   }
// }
