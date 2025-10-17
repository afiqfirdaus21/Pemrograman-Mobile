import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'gallery_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const ProfilePage(),
  '/gallery': (context) => const GalleryPage(),
};
