// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'crop_image.dart';
import 'widgets/option_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo1.png'),
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Import a file to be converted',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
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
          ),
        ],
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
