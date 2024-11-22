import 'package:flutter/material.dart';
import 'package:tripwise/pages/home_page.dart';
import 'package:tripwise/pages/map_page.dart';
import 'package:tripwise/pages/add_tip.dart';
import 'package:tripwise/pages/user/profile_page.dart';
import 'package:tripwise/shared/bottomnav_bar.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    AddTipPage(),
    const ProfilePage(),
  ];

  final List<String> _titles = ["TripWise", "Add Tip", "Profile"];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(_titles[_currentIndex]),
        leading: _currentIndex != 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              )
            : null,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
