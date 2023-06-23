import 'package:flutter/material.dart';

class TranslationContainer extends StatelessWidget {
  final TextAlign textAlign;
  final String language;
  final IconData icon;
  final String text;
  final Function onpressed;

  const TranslationContainer({
    Key? key,
    required this.textAlign,
    required this.onpressed,
    required this.language,
    required this.icon,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.volume_down, color: Colors.black),
              Text(
                language,
                style: const TextStyle(color: Colors.black),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => onpressed,
                icon: const Icon(Icons.copy),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.share),
              const SizedBox(width: 4),
              const Icon(Icons.keyboard_arrow_up),
            ],
          ),
          const Divider(),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3.5,
            child: SingleChildScrollView(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: textAlign,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
