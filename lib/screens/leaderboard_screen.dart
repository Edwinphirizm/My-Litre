import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leaderboard')),
      body: ListView(
        children: [
          ListTile(
            title: Text('user1@example.com'),
            subtitle: Text('Rewards: ZMW 100.0'),
          ),
          ListTile(
            title: Text('user2@example.com'),
            subtitle: Text('Rewards: ZMW 80.0'),
          ),
          ListTile(
            title: Text('user3@example.com'),
            subtitle: Text('Rewards: ZMW 60.0'),
          ),
        ],
      ),
    );
  }
}
