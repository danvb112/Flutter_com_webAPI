
import 'package:flutter/material.dart';
import 'package:fluttercompd/http/webclient.dart';
import 'package:fluttercompd/screens/dashboard.dart';

import 'models/contact.dart';
import 'models/transaction.dart';




void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}

