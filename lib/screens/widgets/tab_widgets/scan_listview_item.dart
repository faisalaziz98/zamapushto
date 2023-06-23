import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScanItemListView extends StatelessWidget {
  final String photoName;
  final DateTime timeAgo;
  final Uint8List image;

  const ScanItemListView({
    Key? key,
    required this.photoName,
    required this.timeAgo,
    required this.image,
    Uint8List? imageBytes,
  }) : super(key: key);

  String formatTimeAgo(DateTime timeAgo) {
    Duration difference = DateTime.now().difference(timeAgo);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hr ago';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} days ago';
    } else {
      return DateFormat('dd/MM/yyyy').format(timeAgo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Image.memory(image),
          title: Text(
            photoName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(formatTimeAgo(timeAgo)), // Use formatTimeAgo here
        ),
      ),
    );
  }
}
