import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../const/const.dart';
class DonePage extends StatelessWidget {
  const DonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CircularPercentIndicator(
              radius: 80.0,
              lineWidth: 10.0,
              percent: 1, // Replace with the actual progress value
              progressColor: Theme.of(context).canvasColor,
              center: const Text(
                'Done', // Replace with the actual progress percentage
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 18.0,top: 20),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle cancel button press
                },
                icon: const Icon(Icons.forward,color: Colors.black87,),
                label:  Text('See Result',style: titleTextStyle.copyWith(fontSize: 12,color: Colors.black87)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).canvasColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
