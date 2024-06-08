import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'bin_management_screen.dart';
import 'reward_adjustment_screen.dart';
import 'add_dumpsite_screen.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    HomeScreen(),
    BinManagementScreen(),
    RewardAdjustmentScreen(),
    AddDumpsiteScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Bin Management',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Reward Adjustment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Add Dumpsite',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.amber[800], // Color when selected
        unselectedItemColor:
            Color.fromARGB(255, 0, 0, 0), // Change to blue or green
        // You can also specify a color for the background of the bottom navigation bar
        backgroundColor: Colors.white,
      ),
    );
  }
}
