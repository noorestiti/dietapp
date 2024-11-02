import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MealPreparationScreen(),
    );
  }
}

class MealPreparationScreen extends StatefulWidget {
  const MealPreparationScreen({super.key});

  @override
  _MealPreparationScreenState createState() => _MealPreparationScreenState();
}

class _MealPreparationScreenState extends State<MealPreparationScreen> {
  String selectedOption = 'Up to 1 hour';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Step 9',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Progress bar
            Container(
              height: 4,
              width: double.infinity,
              color: Colors.grey[300],
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 0.9,
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            // Heading text


            Container(
              margin: const EdgeInsets.all(30),
              child: const Text(
                'Time taken for meal preparation everyday',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 24.0),
            // Option Buttons
            optionButton('Up to 30 minutes', selectedOption),
            const SizedBox(height: 16.0),
            optionButton('Up to 1 hour', selectedOption),
            const SizedBox(height: 16.0),
            optionButton('More than one hour', selectedOption),
          ],
        ),
      ),
    );
  }

  // Option Button Widget
  Widget optionButton(String text, String selected) {
    bool isSelected = text == selected;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = text;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF4F4F) : Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey[300]!,
            width: 2.0,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.access_time,
              color: isSelected ? Colors.white : Colors.grey,
            ),
            const SizedBox(width: 16.0),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}