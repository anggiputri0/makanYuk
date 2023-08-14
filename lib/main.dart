import 'package:flutter/material.dart';
import 'package:resepkuy/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'makanKuy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: Colors.black,
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.white))),
      home: const HomePage(),
    );
  }
}
