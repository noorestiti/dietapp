import 'package:flutter/material.dart';
import 'step6.dart';
void main() {
  runApp(const MaterialApp(
    home: GoalWeightScreen(),
  ));
}

class GoalWeightScreen extends StatefulWidget {
  const GoalWeightScreen({super.key});

  @override
  _GoalWeightScreen createState() => _GoalWeightScreen();
}

class _GoalWeightScreen extends State<GoalWeightScreen> {
  int _selectedIndex = 0;
  final TextEditingController _goalController = TextEditingController(text: "0");
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _goalController.addListener(_validateInput);
  }

  void _validateInput() {
    setState(() {
      _isButtonEnabled = _goalController.text.isNotEmpty && double.tryParse(_goalController.text) != null;
    });
  }

  void _navigateToNextPage() {

    String goalWeight = _goalController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ActivityLevelScreen(),
      ),
    );
    print("Navigating to the next page with weight: $goalWeight");
  }

  void _onToggle(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _goalController.dispose();
    super.dispose();
  }

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
          'Step 5',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _isButtonEnabled ? _navigateToNextPage : null,
            child: Text(
              'Next',
              style: TextStyle(
                color: _isButtonEnabled ? Colors.red : Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 4,
            width: double.infinity,
            color: Colors.grey[300],
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.5,
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          Container(
            margin: const EdgeInsets.all(30),
            child: const Text(
              "What's Your Goal Weight?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 5, left: 15),
            child: const Text(
              'Please answer the question to help us personalize the plan and calculate the daily goal',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          ToggleButtons(
            isSelected: [_selectedIndex == 0, _selectedIndex == 1],
            onPressed: _onToggle,
            color: Colors.black,
            selectedColor: Colors.white,
            fillColor: Colors.red,
            borderRadius: BorderRadius.circular(8.0),
            borderWidth: 2.0,
            borderColor: Colors.white,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Lbs'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Kg'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: _goalController,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50, color: Colors.grey[500]),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                _selectedIndex == 0 ? 'Lbs' : 'Kg',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
