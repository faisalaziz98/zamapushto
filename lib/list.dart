import 'package:flutter/material.dart';
import 'screens/widgets/tab_widgets/document_item.dart';

// late Uint8List croppedImage;
final documentItems = [
  DocumentItem(
    documentIcon: Icons.picture_as_pdf,
    documentName: 'Document 1',
    documentDate: DateTime.now(),
  ),
  DocumentItem(
    documentIcon: Icons.picture_as_pdf,
    documentName: 'Document 2',
    documentDate: DateTime.now().subtract(const Duration(days: 1)),
  ),
  // Add more DocumentItems as needed
];

// List<PdfItem> pdfItems = [
//   PdfItem(
//     pdfName: 'PDF 1',
//     date: '01/01/2023',
//     pdfImage: croppedImage,
//   ),
//   PdfItem(
//     pdfName: 'PDF 2',
//     date: '02/01/2023',
//     pdfImage: croppedImage,
//   ),
//   PdfItem(
//     pdfName: 'PDF 3',
//     date: '03/01/2023',
//     pdfImage: croppedImage,
//   ),
//   PdfItem(
//     pdfName: 'PDF 4',
//     date: '04/01/2023',
//     pdfImage: croppedImage,
//   ),
//   PdfItem(
//     pdfName: 'PDF 5',
//     date: '05/01/2023',
//     pdfImage: croppedImage,
//   ),
//   PdfItem(
//     pdfName: 'PDF 6',
//     date: '06/01/2023',
//     pdfImage: croppedImage,
//   ),
// ];
