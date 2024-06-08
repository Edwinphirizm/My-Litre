import 'package:flutter/material.dart';

class CompanyPortal extends StatefulWidget {
  @override
  _CompanyPortalState createState() => _CompanyPortalState();
}

class _CompanyPortalState extends State<CompanyPortal> {
  String selectedProvince = 'Lusaka';
  String selectedTown = 'Lusaka';
  String selectedDumpsite = 'Dumpsite A';

  final Map<String, List<String>> provinces = {
    'Lusaka': ['Lusaka', 'Chilanga'],
    'Copperbelt': ['Kitwe', 'Ndola'],
  };

  final Map<String, Map<String, List<String>>> dumpsites = {
    'Lusaka': {
      'Lusaka': ['Dumpsite A', 'Dumpsite B'],
      'Chilanga': ['Dumpsite C']
    },
    'Copperbelt': {
      'Kitwe': ['Dumpsite D'],
      'Ndola': ['Dumpsite E']
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Company Portal')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Province:'),
            DropdownButton<String>(
              value: selectedProvince,
              onChanged: (String? newValue) {
                setState(() {
                  selectedProvince = newValue!;
                  selectedTown = provinces[selectedProvince]!.first;
                  selectedDumpsite =
                      dumpsites[selectedProvince]![selectedTown]!.first;
                });
              },
              items:
                  provinces.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Text('Select Town:'),
            DropdownButton<String>(
              value: selectedTown,
              onChanged: (String? newValue) {
                setState(() {
                  selectedTown = newValue!;
                  selectedDumpsite =
                      dumpsites[selectedProvince]![selectedTown]!.first;
                });
              },
              items: provinces[selectedProvince]!
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Text('Select Dumpsite:'),
            DropdownButton<String>(
              value: selectedDumpsite,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDumpsite = newValue!;
                });
              },
              items: dumpsites[selectedProvince]![selectedTown]!
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              decoration:
                  InputDecoration(labelText: 'Quantity of Bottles to Buy'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Placeholder for buying bottles
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Bottles Bought from $selectedDumpsite'),
                ));
              },
              child: Text('Buy Bottles'),
            ),
          ],
        ),
      ),
    );
  }
}
