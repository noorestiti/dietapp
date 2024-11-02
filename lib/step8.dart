import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GridSelectionScreen(),
    );
  }
}


class GridSelectionScreen extends StatefulWidget {
  const GridSelectionScreen({super.key});

  @override
  _GridSelectionScreenState createState() => _GridSelectionScreenState();
}

class _GridSelectionScreenState extends State<GridSelectionScreen> {
  late List<GridItem> gridItems;

  @override
  void initState() {
    super.initState();
    gridItems = List.from(initialGridItems);
  }

  void _onItemTap(int index) {
    setState(() {
      gridItems[index].isSelected = !gridItems[index].isSelected;
    });
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
          'Step 8',
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
              widthFactor: 0.8,
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          Container(
            margin: const EdgeInsets.all(30),
            child: const Text(
              "Choose a diet plan that fits your lifestyle",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: gridItems.length,
              itemBuilder: (context, index) {
                final item = gridItems[index];
                return GestureDetector(
                  onTap: () => _onItemTap(index),
                  child: GridTile(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(item.imageAsset),
                              radius: 50,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            color: item.isSelected ? const Color(0xFFFFE9E9) : Colors.transparent, // Light pink when selected
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                            child: Text(
                              item.label,
                              style: TextStyle(
                                color: item.isSelected ? const Color(0xFFFF4F4F) : Colors.black, // Red text when selected
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
class GridItem {
  final String imageAsset;
  final String label;
  bool isSelected;

  GridItem({
    required this.imageAsset,
    required this.label,
    this.isSelected = false,
  });
}


final List<GridItem> initialGridItems = [
  GridItem(imageAsset: 'Assets/1.jpeg', label: 'Low Carb '),
  GridItem(imageAsset: 'Assets/2.jpeg', label: 'Busy LifeStyle'),
  GridItem(imageAsset: 'Assets/3.jpeg', label: 'Celebrity'),
  GridItem(imageAsset: 'Assets/4.jpeg', label: 'Detox'),
  GridItem(imageAsset: 'Assets/5.jpeg', label: 'Doctor\'s way '),
  GridItem(imageAsset: 'Assets/6.jpeg', label: 'Fad'),
  GridItem(imageAsset: 'Assets/7.jpeg', label: 'Fixed Calarious'),
  GridItem(imageAsset: 'Assets/8.jpeg', label: 'Flat Belly'),
  GridItem(imageAsset: 'Assets/9.jpeg', label: 'Healthy'),
  GridItem(imageAsset: 'Assets/10.jpeg', label: 'High Protein '),
  GridItem(imageAsset: 'Assets/11.jpeg', label: 'Zone'),
  GridItem(imageAsset: 'Assets/12.jpeg', label: 'Keto'),
  GridItem(imageAsset: 'Assets/13.jpeg', label: 'Blood Type'),
  GridItem(imageAsset: 'Assets/14.jpeg', label: 'Vegetarian'),
  GridItem(imageAsset: 'Assets/15.jpeg', label: 'Wedding'),
  GridItem(imageAsset: 'Assets/16.jpeg', label: 'Montignac'),
  GridItem(imageAsset: 'Assets/17.jpeg', label: 'Paleo'),
  GridItem(imageAsset: 'Assets/18.jpeg', label: 'Scarsdale'),
  GridItem(imageAsset: 'Assets/19.jpeg', label: 'Low Glycemic Index '),
  GridItem(imageAsset: 'Assets/20.jpeg', label: 'Low Cholesterol'),
  GridItem(imageAsset: 'Assets/21.jpeg', label: 'Immunity Boosting '),

];