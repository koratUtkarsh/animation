import 'package:animation/screen/home/view/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/':(context) => HomeScreen(),
      },
    ),
  );
}

