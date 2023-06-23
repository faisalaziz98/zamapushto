import 'package:flutter/material.dart';

class LanguageSelectorContainer extends StatelessWidget {
  final String language;
  final IconData icon;
  final Color backgroundColor;
  const LanguageSelectorContainer({
    super.key,
    required this.language,
    required this.icon,
    required this.backgroundColor,
    required Null Function() onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 120,
              height: 35,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    language,
                    style: const TextStyle(color: Colors.black),
                  ),
                  Icon(
                    icon,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
