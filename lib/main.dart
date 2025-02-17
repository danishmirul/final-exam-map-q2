import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Question2',
      home: LoginScreen(),
    ));

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashboardScreen())),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlutterLogo(size: 150),
        Text('Loading assets. Please wait ...',
            style: TextStyle(fontSize: 15, color: Colors.white)),
        SizedBox(height: 50),
        CircularProgressIndicator(),
      ],
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Testing user login'),
            SizedBox(
              height: 50,
            ),
            FloatingActionButton.extended(
              heroTag: null,
              label: Text('If login fails'),
              backgroundColor: Colors.red,
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ErrorScreen())),
            ),
            FloatingActionButton.extended(
              heroTag: null,
              label: Text('If login succeeds'),
              backgroundColor: Colors.green,
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SplashScreen())),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome!. This is your Dashboard',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 50)),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen())),
    );
    return Scaffold(
      appBar: AppBar(title: Text('Login failed')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('You have entered incorrect username or password.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 30),
          Text('Redirecting to the login screen. Please wait..'),
        ],
      ),
    );
  }
}
