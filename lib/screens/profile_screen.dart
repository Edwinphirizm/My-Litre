import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Column(
        children: [
          // Map placeholder section
          Container(
            height: MediaQuery.of(context).size.height *
                0.5, // Half the screen height
            width: double.infinity,
            margin: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: Text(
                'Map Placeholder',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          // Reward section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, user@example.com',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Current Rewards: ZMW 50.0',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Placeholder for transferring rewards
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Rewards Transferred'),
                      ));
                    },
                    child: Text('Transfer Rewards'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
