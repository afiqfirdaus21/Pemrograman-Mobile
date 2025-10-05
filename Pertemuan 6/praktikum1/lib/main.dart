import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Belajar Scaffold & AppBar"),
          backgroundColor: Colors.teal,
          actions: const [
            Icon(Icons.search),
            Icon(Icons.settings),
          ],
        ),
        body: const Center(
          child: Text("Ini Body Aplikasi"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
