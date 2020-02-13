import 'package:finanza/screens/home_screen.dart';
import 'package:finanza/utilities/colors.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}