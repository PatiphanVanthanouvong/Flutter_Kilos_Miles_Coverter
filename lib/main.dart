import 'package:flutter/material.dart';
import 'package:flutter_kilos_mile_hw/converter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.pink[200],
              secondary: Colors.black,
            ),
      ),
      home: const ConverterApp(),
    );
  }
}
