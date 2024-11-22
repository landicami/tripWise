import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: widget.currentIndex == 0
              ? const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: Icon(
                    Icons.map,
                    color: Colors.blue,
                  ),
                )
              : const Icon(Icons.map),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: widget.currentIndex == 1
              ? const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                )
              : const Icon(Icons.add),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: widget.currentIndex == 2
              ? const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                )
              : const Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: widget.currentIndex,
      onTap: widget.onItemTapped,
    );
  }
}
