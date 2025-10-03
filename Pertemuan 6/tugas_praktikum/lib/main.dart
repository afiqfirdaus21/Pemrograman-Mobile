import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lirik Lagu',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      home: const LyricsScreen(),
    );
  }
}

class LyricsScreen extends StatelessWidget {
  const LyricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ours to keep'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul Lagu
            const Text(
              'Ours to keep',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Nama Artis
            const Text(
              'Kendis ft. Adis',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 32.0),
            
            const Text("How are you in your time alone?", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("I'm doing fine, well, I'm not", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("I feel like I wanna die", style: TextStyle(fontSize: 17, height: 1.5)),
            const SizedBox(height: 16.0),

            const Text("I have so much to tell you, love", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("From the start of the day", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("'Til the the dawn breaks away", style: TextStyle(fontSize: 17, height: 1.5)),
            const SizedBox(height: 16.0),

            const Text("I've been thinking of you", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("And I've been missing your voice on the other side", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("And I've been dreaming of you", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("And I can hear you singing through the silent night", style: TextStyle(fontSize: 17, height: 1.5)),
            const SizedBox(height: 16.0),

            const Text("Do you ever feel the need to get away from me?", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("Do I bore you?", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("Or do you want to", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("Take me from this crowded place to", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("Somewhere we can find some peace", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("And the world is ours to keep, mm", style: TextStyle(fontSize: 17, height: 1.5)),
            const SizedBox(height: 16.0),

            const Text("They don't have to know how we touch", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("'Cause this feeling's all ours", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("And they'd become so loud trying to", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("Fix what was never really broken", style: TextStyle(fontSize: 17, height: 1.5)),
            const SizedBox(height: 16.0),

            const Text("And you are my safe haven", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("I am on your side", style: TextStyle(fontSize: 17, height: 1.5)),
            const SizedBox(height: 16.0),

            // Dan seterusnya untuk semua lirik...
            const Text("Do you ever feel the need to get away from me?", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("Do I bore you?", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("Or do you want to", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("Take me from this crowded place to", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("Somewhere we can find some peace", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("And the world is ours to keep, mm", style: TextStyle(fontSize: 17, height: 1.5)),
            const SizedBox(height: 16.0),

            const Text("In this world, we are fading away", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("And I'm not fine", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("Sometimes, it gets so lonely", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("And I'm still scared to ask for help", style: TextStyle(fontSize: 17, height: 1.5)),
            const SizedBox(height: 16.0),

            const Text("But I'll look at you the same as today", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("The one that I've been needing", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("I never thought I'd have", style: TextStyle(fontSize: 17, height: 1.5)),
            const SizedBox(height: 16.0),

            const Text("I've been thinking of you", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("And I've been missing your voice on the other side", style: TextStyle(fontSize: 17, height: 1.5)),
            const SizedBox(height: 16.0),

            const Text("Do you ever feel the need to get away from me? (I've been missing you)", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("Do I bore you? (Voice on the other side)", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("Or do you want to", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("Take me from this crowded place to (I've been dreaming of you)", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("Somewhere we can find some peace (and I can hear you singing)", style: TextStyle(fontSize: 17, height: 1.5)),
            const Text("And the world is ours to keep (through the silent night)", style: TextStyle(fontSize: 17, height: 1.5)),

          ],
        ),
      ),
    );
  }

}