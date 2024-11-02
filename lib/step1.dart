import 'package:flutter/material.dart';
import 'step2.dart';

void main() {
  runApp(const MaterialApp(
    home: Gender(),
  ));
}

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  void _navigateToStep2(String gender) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Age(),
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
          'Step 1',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            height: 4,
            width: double.infinity,
            color: Colors.grey[300],
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor:0.1,
              child: Container(
                color: Colors.red,
              ),
            ),
          ),

          const SizedBox(height: 24.0),
          Center(
            child:Container(
              margin: const EdgeInsets.all(30),
              child: const Text(
                "What's Your Gender?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          )
          , Container(
            margin: const EdgeInsets.only(right: 5, left: 15),
            child: const Text(
              "Please answer the following questions to help us personalize "
                  "your plan and calculate your daily goal.",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child:GestureDetector(
              onTap: () => _navigateToStep2('Male'),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "👨",
                      style: TextStyle(fontSize: 50),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Male",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Center(
            child: GestureDetector(
              onTap: () => _navigateToStep2('Female'),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "👧",
                      style: TextStyle(fontSize: 50),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Female",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
