import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MealSelectionScreen(),
    );
  }
}

class MealSelectionScreen extends StatefulWidget {
  const MealSelectionScreen({super.key});

  @override
  _MealSelectionScreenState createState() => _MealSelectionScreenState();
}

class _MealSelectionScreenState extends State<MealSelectionScreen> {
  bool isBreakfastSelected = false;
  bool isSnacksSelected = false;
  bool isLunchSelected = false;
  bool isDinnerSelected = false;

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
          'Step 10',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress bar
            Container(
              height: 4,
              width: double.infinity,
              color: Colors.grey[300],
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 1.0,
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
                "Which meals do you want to have everyday ? ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24.0),
            // List of meals with switches
            mealOption('Breakfast', '🍳', isBreakfastSelected, (value) {
              setState(() {
                isBreakfastSelected = value;
              });
            }),
            mealOption('Snacks', '🍒', isSnacksSelected, (value) {
              setState(() {
                isSnacksSelected = value;
              });
            }),
            mealOption('Lunch', '🍲', isLunchSelected, (value) {
              setState(() {
                isLunchSelected = value;
              });
            }),
            mealOption('Dinner', '🍛', isDinnerSelected, (value) {
              setState(() {
                isDinnerSelected = value;
              });
            }),
            const Spacer(),
            // Instruction text
            const Text(
              'At least three meals are to be selected to reach your daily goal.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16.0),
            // Done button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (isBreakfastSelected ||
                    isSnacksSelected ||
                    isLunchSelected ||
                    isDinnerSelected)
                    ? () {

                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: (isBreakfastSelected ||
                      isSnacksSelected ||
                      isLunchSelected ||
                      isDinnerSelected)
                      ? Colors.red
                      : Colors.grey[300],
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text('Done',style: TextStyle(color: Colors.white30),),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget mealOption(String mealName, String emoji, bool isSelected, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: Text(
          emoji,
          style: const TextStyle(fontSize: 24.0),
        ),
        title: Text(
          mealName,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Switch(
          value: isSelected,
          onChanged: onChanged,
          activeColor: Colors.red,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.white30,
        ),
      ),
    );
  }
}
