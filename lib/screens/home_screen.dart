import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Analytics'),
            Tab(text: 'Finance'),
            Tab(text: 'Admin'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AnalyticsTab(),
          FinanceTab(),
          AdminTab(),
        ],
      ),
    );
  }
}

class AnalyticsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total Bins: 100', style: TextStyle(fontSize: 18)),
          Text('Total Dumpsites: 50', style: TextStyle(fontSize: 18)),
          Text('Registered Companies: 20', style: TextStyle(fontSize: 18)),
          Text('Registered Consumers: 1000', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class FinanceTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total Users Activity: 500', style: TextStyle(fontSize: 18)),
          Text('Total Rewards Paid: ZMW 10,000',
              style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Code for filtering data
            },
            child: Text('Select Date Range'),
          ),
        ],
      ),
    );
  }
}

class AdminTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total Revenue from Sold Bottles: ZMW 20,000',
              style: TextStyle(fontSize: 18)),
          Text('Top Producing Province: Lusaka',
              style: TextStyle(fontSize: 18)),
          Text('Top Producing Dumpsite: Dumpsite A',
              style: TextStyle(fontSize: 18)),
          Text('Top Purchasing Company: Company X',
              style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
