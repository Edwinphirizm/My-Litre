import 'package:flutter/material.dart';

class AddDumpsiteScreen extends StatelessWidget {
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _townController = TextEditingController();
  final TextEditingController _dumpsiteNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add Dumpsite:'),
          TextField(
            controller: _provinceController,
            decoration: InputDecoration(labelText: 'Province'),
          ),
          TextField(
            controller: _townController,
            decoration: InputDecoration(labelText: 'Town'),
          ),
          TextField(
            controller: _dumpsiteNameController,
            decoration: InputDecoration(labelText: 'Dumpsite Name'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Placeholder for adding dumpsite
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Dumpsite Added'),
              ));
              _provinceController.clear();
              _townController.clear();
              _dumpsiteNameController.clear();
            },
            child: Text('Add Dumpsite'),
          ),
        ],
      ),
    );
  }
}
