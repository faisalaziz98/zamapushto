// ignore_for_file: library_private_types_in_public_api

import 'dart:typed_data';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'mian_page.dart';

class CropImagePage extends StatefulWidget {
  final String imagePath;

  const CropImagePage({Key? key, required this.imagePath}) : super(key: key);

  @override
  _CropImagePageState createState() => _CropImagePageState();
}

class _CropImagePageState extends State<CropImagePage> {
  final _cropController = CropController();
  Uint8List? _croppedImage;

  Future<Uint8List> _readImageData() async {
    final file = File(widget.imagePath);
    return await file.readAsBytes();
  }

  void _navigateToMainScreen(Uint8List croppedImage) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(croppedImage: croppedImage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.cancel_sharp,
                        size: 32,
                        color: Colors.redAccent,
                      ),
                    ),
                    const Text(
                      'Crop',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        _cropController.crop();
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius: BorderRadius.circular(20)),
                        width: 27,
                        height: 27,
                        child: const Icon(
                          Icons.check,
                        ),
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: FutureBuilder<Uint8List>(
                future: _readImageData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return const Text('Error loading image');
                  } else if (snapshot.hasData) {
                    final imageData = snapshot.data!;
                    return Crop(
                      controller: _cropController,
                      image: imageData,
                      // constraints: BoxConstraints.expand(),
                      onCropped: (croppedData) {
                        setState(() {
                          _croppedImage = croppedData;
                        });
                        _navigateToMainScreen(croppedData);
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
            if (_croppedImage != null) ...[
              const SizedBox(height: 20),
              Image.memory(_croppedImage!),
            ],
          ],
        ),
      ),
    );
  }
}
