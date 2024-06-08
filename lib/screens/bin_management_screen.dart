import 'package:flutter/material.dart';

class BinManagementScreen extends StatelessWidget {
  final TextEditingController _binLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add Bin Location:'),
          TextField(
            controller: _binLocationController,
            decoration: InputDecoration(labelText: 'New Bin Location'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Placeholder for adding bin location
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Bin Location Added'),
              ));
              _binLocationController.clear();
            },
            child: Text('Add Bin Location'),
          ),
        ],
      ),
    );
  }
}
