import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contoh Column',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contoh Column"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,   // posisi vertikal di tengah
        crossAxisAlignment: CrossAxisAlignment.start, // rata kiri
        children: const [
          Text("Baris 1", style: TextStyle(fontSize: 20)),
          Text("Baris 2", style: TextStyle(fontSize: 20)),
          Text("Baris 3", style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
