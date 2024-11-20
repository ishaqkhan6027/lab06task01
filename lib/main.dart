import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ResponsiveGridPage(),
    );
  }
}

class ResponsiveGridPage extends StatelessWidget {
  const ResponsiveGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/beach_sunset.jpg',
      'assets/images/misty_forest.jpg',
      'assets/images/city_night.jpg',
      'assets/images/snowy_mountain.jpg',
      'assets/images/autumn_cabin.jpg',
      'assets/images/futuristic_city.jpg',
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth ~/ 150;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Grid'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount > 0 ? crossAxisCount : 1,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
