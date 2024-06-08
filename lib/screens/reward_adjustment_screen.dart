import 'package:flutter/material.dart';

class RewardAdjustmentScreen extends StatelessWidget {
  final TextEditingController _rewardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Adjust Reward:'),
          TextField(
            controller: _rewardController,
            decoration:
                InputDecoration(labelText: 'Plastic Bottle Reward (ZMW)'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Placeholder for adjusting reward
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Reward Adjusted'),
              ));
              _rewardController.clear();
            },
            child: Text('Adjust Reward'),
          ),
        ],
      ),
    );
  }
}
