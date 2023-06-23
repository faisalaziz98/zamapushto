import 'package:flutter/material.dart';

class OptionContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const OptionContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              size: 35,
              color: Colors.black54,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
