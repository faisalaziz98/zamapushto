import 'dart:typed_data';

import 'package:flutter/material.dart';

class PdfItem extends StatelessWidget {
  final String pdfName;
  final String date;
  final Uint8List pdfImage;

  const PdfItem({
    Key? key,
    required this.pdfName,
    required this.date,
    required this.pdfImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        tileColor: Colors.white,
        leading: Image.memory(pdfImage),
        title: Text(pdfName),
        subtitle: Text(date),
      ),
    );
  }
}
