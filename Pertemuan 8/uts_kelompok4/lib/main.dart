import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'contact_list.dart';
import 'contact_detail.dart';
import 'add_contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kontak App',
      theme: ThemeData.dark(useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/contact_list': (context) => const ContactListPage(),
        '/add_contact': (context) => const AddContactPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/contact_detail') {
          final contact = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) => ContactDetailPage(contact: contact),
          );
        }
        return null;
      },
    );
  }
}
