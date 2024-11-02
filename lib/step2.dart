import 'package:flutter/material.dart';
import 'step3.dart';

void main() {
  runApp(const MaterialApp(
    home: Age(),
  ));
}

class Age extends StatefulWidget {
  const Age({super.key});

  @override
  _AgeState createState() => _AgeState();

}

class _AgeState extends State<Age> {
  final TextEditingController _ageController = TextEditingController(text: "30");
  bool _isButtonEnabled = false;
  @override
  void initState() {
    super.initState();
    _ageController.addListener(_validateInput);
  }
  void _validateInput() {
    final text = _ageController.text;
    setState(() {
      _isButtonEnabled = text.isNotEmpty;
    });
  }
  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HeightInputScreen(age: _ageController.text),
      ),
    );
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
          'Step 2',
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
              widthFactor: 0.2,
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          Container(
            margin: const EdgeInsets.all(30),
            child: const Text(
              "What's your age ?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(right: 5, left: 15),
              child: const Text(
                "Please answer the following questions to help us personalize "
                    "your plan and calculate your daily goal.",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 50.0),
          Center(
            child: TextField(

              controller: _ageController,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50,
                  color: Colors.grey[500]),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(

                border: InputBorder.none,
              ),

            ),
          ),

        ],),);}
  @override
  void dispose() {
    _ageController.removeListener(_validateInput);
    _ageController.dispose();
    super.dispose();
  }

}
