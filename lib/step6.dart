import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp(
    home: ActivityLevelScreen(),
  ));
}

class ActivityLevelScreen extends StatefulWidget {
  const ActivityLevelScreen({super.key});

  @override
  _ActivityLevelScreenState createState() => _ActivityLevelScreenState();
}

class _ActivityLevelScreenState extends State<ActivityLevelScreen> {
  int _selectedIndex = 2;

  final List<Map<String, dynamic>> activityLevels = [
    {
      'title': 'Sedentary',
      'description': 'Little to no exercise',
      'icon': Icons.bed,
    },
    {
      'title': 'Lightly Active',
      'description': 'Exercise 1-3 days/week',
      'icon': Icons.laptop_mac,
    },
    {
      'title': 'Moderately Active',
      'description': 'Exercise 3-5 days/week',
      'icon': Icons.directions_run,
    },
    {
      'title': 'Very Active',
      'description': 'Exercise 6-7 days/week',
      'icon': Icons.directions_bike,
    },
    {
      'title': 'Extra Active',
      'description': 'Physical job or 2x training everyday',
      'icon': Icons.whatshot,
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
          'Step 6',
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
              widthFactor: 0.6,
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          Container(
            margin: const EdgeInsets.all(30),
            child: const Text(
              "What's your activity level?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: activityLevels.length,
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
                      leading: Icon(
                        activityLevels[index]['icon'],
                        color: _selectedIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                      title: Text(
                        activityLevels[index]['title'],
                        style: TextStyle(
                          color: _selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        activityLevels[index]['description'],
                        style: TextStyle(
                          color: _selectedIndex == index
                              ? Colors.white
                              : Colors.grey,
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


        ],),);}}