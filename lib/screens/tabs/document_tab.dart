import 'package:flutter/material.dart';
import 'package:pushto/screens/widgets/tab_widgets/document_item.dart';

class DocumentTab extends StatelessWidget {
  final List<DocumentItem> documentItems;

  const DocumentTab({Key? key, required this.documentItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: documentItems.length,
          itemBuilder: (context, index) {
            final documentItem = documentItems[index];
            return DocumentItem(
              documentIcon: documentItem.documentIcon,
              documentName: documentItem.documentName,
              documentDate: documentItem.documentDate,
            );
          },
        ),
      ),
    );
  }
}
