import 'package:flutter/material.dart';
import 'package:news_app/src/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Times"
      ),
      debugShowCheckedModeBanner: false,
      title: 'News App',
      home: const HomeScreen(),
    );
  }
}
