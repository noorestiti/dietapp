import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DietFamiliarityScreen(),
    );
  }
}

class DietFamiliarityScreen extends StatefulWidget {
  const DietFamiliarityScreen({super.key});

  @override
  _DietFamiliarityScreenState createState() => _DietFamiliarityScreenState();
}

class _DietFamiliarityScreenState extends State<DietFamiliarityScreen> {
  int? _selectedIndex;

  final List<Map<String, dynamic>> familiarityOptions = [
    {
      'title': 'Expert',
      'emoji': '😎',
    },
    {
      'title': 'I’ve tried once or twice',
      'emoji': '😌',
    },
    {
      'title': 'Beginner',
      'emoji': '🧘🏻',
    },
  ];


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
          'Step 7',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 4,
            width: double.infinity,
            color: Colors.grey[300],
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.7,
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          Container(
            margin: const EdgeInsets.all(30),
            child: const Text(
              "How familiar are you with dieting ?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: familiarityOptions.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: _selectedIndex == index ? Colors.red : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _selectedIndex == index
                            ? Colors.red
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    child: ListTile(
                      leading: Text(
                        familiarityOptions[index]['emoji'],
                        style: TextStyle(
                          fontSize: 24, // Adjust font size as needed
                          color: _selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      title: Text(
                        familiarityOptions[index]['title'],
                        style: TextStyle(
                          color: _selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'The selection can be changed later within the application.',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        ],


      ),);}}