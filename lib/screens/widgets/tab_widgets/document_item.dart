import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // for date formatting

class DocumentItem extends StatelessWidget {
  final IconData documentIcon;
  final String documentName;
  final DateTime documentDate;

  const DocumentItem({
    Key? key,
    required this.documentIcon,
    required this.documentName,
    required this.documentDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd/MM/yy').format(documentDate);

    return ListTile(
      leading: Icon(documentIcon), // or Image.asset() for picture
      title: Text(documentName),
      subtitle: Text(formattedDate),
    );
  }
}
