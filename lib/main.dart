import 'package:flutter/material.dart';
import 'screens/auth_screen.dart';
import 'screens/admin_panel.dart';
import 'screens/profile_screen.dart';
import 'screens/company_portal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plastic Recycling App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AuthScreen(),
        '/admin': (context) => AdminPanel(),
        '/profile': (context) => ProfileScreen(),
        '/company': (context) => CompanyPortal(),
      },
    );
  }
}
