// lib/routes/app_routes.dart
import 'package:flutter/material.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';
import '../pages/home_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/login': (ctx) => LoginPage(),
      '/register': (ctx) => RegisterPage(),
      '/home': (ctx) => HomePage(),
    };
  }
}
