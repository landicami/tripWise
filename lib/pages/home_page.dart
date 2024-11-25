import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tripwise/pages/map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text('Travel through friends', style: TextStyle(fontSize: 30)),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    // Filter map showing only stays
                  },
                  icon: const Icon(Icons.hotel),
                  tooltip: 'Stays',
                ),
                IconButton(
                  onPressed: () {
                    // Filter map showing only food
                  },
                  icon: const Icon(Icons.restaurant),
                  tooltip: 'Food',
                ),
                IconButton(
                  onPressed: () {
                    // Filter map showing only things to do
                  },
                  icon: const Icon(Icons.explore),
                  tooltip: 'Things to Do',
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: const MapPage(),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
