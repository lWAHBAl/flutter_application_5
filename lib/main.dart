import 'package:flutter/material.dart';
import 'package:flutter_application_5/R.dart';
import 'package:flutter_application_5/requests.dart';
import 'package:flutter_application_5/Homelayout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RequestsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
