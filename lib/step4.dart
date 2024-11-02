import 'package:flutter/material.dart';
import 'step5.dart';


void main() {
  runApp(const MaterialApp(
    home: CurrentWeightScreen(weight: '0'),
  ));
}

class CurrentWeightScreen extends StatefulWidget {
  final String weight;

  const CurrentWeightScreen({super.key, required this.weight});

  @override
  _CurrentWeightScreen createState() => _CurrentWeightScreen();
}

class _CurrentWeightScreen extends State<CurrentWeightScreen> {
  int _selectedIndex = 0;
  final TextEditingController _currentweightController = TextEditingController(text: "0");
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _currentweightController.addListener(_validateInput);
  }

  void _validateInput() {
    final text = _currentweightController.text;
    setState(() {
      _isButtonEnabled = text.isNotEmpty;
    });
  }

  void _onToggle(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GoalWeightScreen(),
      ),
    );
    print("Navigating to the next page with weight: ${_currentweightController.text}");
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
          'Step 4',
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
              widthFactor: 0.4,
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          Container(
            margin: const EdgeInsets.all(30),
            child: const Text(
              "What's your current weight?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 5, left: 15),
            child: const Text(
              'It\'s ok to guess. You can always adjust your weight later.',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 50.0),
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
          const SizedBox(height: 90),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextField(
                  controller: _currentweightController,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50, color: Colors.grey[500]),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,

                  ),
                ),
              ),
              Text(
                _selectedIndex == 0 ? 'Lbs' : 'Kg',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _currentweightController.dispose();
    super.dispose();
  }
}
