import 'package:flutter/material.dart';
import 'step4.dart';

void main() {
  runApp(const MaterialApp(
    home: HeightInputScreen(age: ''),
  ));
}

class HeightInputScreen extends StatefulWidget {
  final String age;

  const HeightInputScreen({super.key, required this.age});

  @override
  _HeightInputScreenState createState() => _HeightInputScreenState();
}

class _HeightInputScreenState extends State<HeightInputScreen> {
  int _selectedIndex = 0;
  final TextEditingController _heightController = TextEditingController(text: "0");
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _heightController.addListener(_validateInput);
  }

  void _validateInput() {
    final text = _heightController.text;
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
        builder: (context) => const CurrentWeightScreen(weight: '',),
      ),
    );
    print("Navigating to the next page with height: ${_heightController.text}");
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
          'Step 3',
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
              widthFactor: 0.3,
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          Container(
            margin: const EdgeInsets.all(30),
            child: const Text(
              "What's your height?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 5, left: 15),
            child: const Text(
              "Please answer the following questions to help us personalize "
                  "your plan and calculate your daily goal.",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30.0),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                        child: Text('Ft'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Cm'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _heightController,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 50, color: Colors.grey[500]),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter height',
                          ),
                        ),
                      ),

                      const SizedBox(width: 5),
                      Text(
                        _selectedIndex == 0 ? 'ft' : 'cm',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _heightController.removeListener(_validateInput);
    _heightController.dispose();
    super.dispose();
  }
}
