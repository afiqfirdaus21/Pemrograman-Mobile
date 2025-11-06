import 'package:flutter/material.dart';

class ContactDetailPage extends StatelessWidget {
  final Map<String, String> contact;
  const ContactDetailPage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact['name']!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.grey[900],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blueGrey,
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Text(
                  contact['name']!,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(contact['phone']!),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.call, color: Colors.blue, size: 30),
                    Icon(Icons.message, color: Colors.blue, size: 30),
                    Icon(Icons.video_call, color: Colors.blue, size: 30),
                    Icon(Icons.info, color: Colors.blue, size: 30),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
