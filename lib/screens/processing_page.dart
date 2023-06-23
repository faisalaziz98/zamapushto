import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProcessingPage extends StatelessWidget {
  const ProcessingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace this with your actual progress value
    double progress = 1.0;

    if (progress == 1.0) {
      // Navigate to ResultPage if progress is 100%
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ResultPage(),
        //   ),
        // );
      });
    }

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
            const Spacer(flex: 1),
            CircularPercentIndicator(
              radius: 80.0,
              lineWidth: 10.0,
              percent: progress,
              progressColor: Theme.of(context).canvasColor,
              center: Text(
                '${(progress * 100).toInt()}%',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Analyzing Text Layout',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please be patient, this may take a while',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Spacer(flex: 2),
            const Text(
              'Estimated waiting time: 15 sec',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle cancel button press
                },
                icon: const Icon(Icons.close),
                label: const Text('Cancel'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFFFF3778),
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
