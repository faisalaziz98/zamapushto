// ignore_for_file: library_private_types_in_public_api

import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../widgets/tab_widgets/pdf_item.dart';

class PdfTab extends StatefulWidget {
  final Uint8List croppedImage;

  const PdfTab({Key? key, required this.croppedImage}) : super(key: key);

  @override
  _PdfTabState createState() => _PdfTabState();
}

class _PdfTabState extends State<PdfTab> {
  bool isGridView = false;

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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
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
            ),
            Expanded(
              child: isGridView
                  ? GridView.count(
                      crossAxisCount: 2,
                      padding: const EdgeInsets.all(8),
                      children: [
                        PdfItem(
                          pdfName: 'pdf1',
                          date: '23/3/2023',
                          pdfImage: widget.croppedImage,
                        ),
                      ],
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return PdfItem(
                          pdfName: 'pdf1',
                          date: '23/3/2023',
                          pdfImage: widget.croppedImage,
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
