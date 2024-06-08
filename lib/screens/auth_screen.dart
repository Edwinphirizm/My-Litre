import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _selectedRole = 'Consumer'; // Default role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plastic Recycling App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'National ID or Passport'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Text('Select Role:'),
            RadioListTile(
              title: Text('Consumer'),
              value: 'Consumer',
              groupValue: _selectedRole,
              onChanged: (value) {
                setState(() {
                  _selectedRole = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text('Company'),
              value: 'Company',
              groupValue: _selectedRole,
              onChanged: (value) {
                setState(() {
                  _selectedRole = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text('Department Admin'),
              value: 'Department Admin',
              groupValue: _selectedRole,
              onChanged: (value) {
                setState(() {
                  _selectedRole = value.toString();
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                switch (_selectedRole) {
                  case 'Consumer':
                    Navigator.pushNamed(context, '/profile');
                    break;
                  case 'Company':
                    Navigator.pushNamed(context, '/company');
                    break;
                  case 'Department Admin':
                    Navigator.pushNamed(context, '/admin');
                    break;
                  default:
                    break;
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
