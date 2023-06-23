// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, unused_element, deprecated_member_use

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pushto/screens/tabs/scan_tabb.dart';
import 'package:pushto/screens/widgets/option_container.dart';

import '../const/const.dart';
import '../list.dart';
import 'crop_image.dart';
import 'tabs/document_tab.dart';
import 'tabs/pdf_tab.dart';

class MainScreen extends StatefulWidget {
  final Uint8List croppedImage;

  const MainScreen({Key? key, required this.croppedImage}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool _isFloatingActionButtonClicked = false;

  void _toggleFloatingActionButton() {
    setState(() {
      _isFloatingActionButtonClicked = !_isFloatingActionButtonClicked;
    });
  }

  void _showOptionsBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          ),
          height: MediaQuery.of(context).size.height * 0.5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Import a file to be converted',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                OptionContainer(
                  icon: Icons.camera_alt,
                  text: 'Take a Picture',
                  onTap: () => takePicture(context),
                ),
                const SizedBox(height: 20),
                OptionContainer(
                  icon: Icons.photo_library,
                  text: 'Gallery',
                  onTap: () => importFromGallery(context),
                ),
                const SizedBox(height: 20),
                OptionContainer(
                  icon: Icons.insert_drive_file,
                  text: 'Documents',
                  onTap: () => importDocuments(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_selectedIndex == 0)
                      const Text('My Scans', style: titleTextStyle),
                    if (_selectedIndex == 1)
                      const Text('My Document', style: titleTextStyle),
                    if (_selectedIndex == 2)
                      const Text('My PDF', style: titleTextStyle),
                  ],
                ),
              ),
              DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 12,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color.fromARGB(255, 202, 200, 200),
                        ),
                        child: TabBar(
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: const Color(0xFF639CFA),
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.white,
                          tabs: const [
                            Tab(text: 'Scans'),
                            Tab(text: 'Document'),
                            Tab(text: 'PDF'),
                          ],
                          onTap: (index) {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.transparent,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: TabBarView(
                        children: [
                          ScanTab(croppedImage: widget.croppedImage),
                          DocumentTab(documentItems: documentItems),
                          PdfTab(croppedImage: widget.croppedImage),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 80,
              child: FloatingActionButton(
                onPressed: () => _showOptionsBottomSheet(context),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                heroTag: null,
                child: const Text('Scan'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void takePicture(BuildContext context) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      // Process the picked image
      // Example: Display it in a new screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CropImagePage(imagePath: pickedImage.path),
        ),
      );
    }
  }

  void importFromGallery(BuildContext context) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // Process the picked image
      // Example: Display it in a new screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CropImagePage(imagePath: pickedImage.path),
        ),
      );
    }
  }

  void importDocuments(BuildContext context) async {
    // Show file picker dialog
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      // Get the selected file path
      final String filePath = result.files.single.path!;

      // Pass the file path to the CropImagePage without navigating to it
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CropImagePage(imagePath: filePath),
        ),
      );
    }
  }
}
