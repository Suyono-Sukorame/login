// lib/controllers/auth_controller.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class AuthController with ChangeNotifier {
  User? _user;

  User? get user => _user;

  Future<void> login(String email, String password) async {
    _user = await AuthService().login(email, password);
    notifyListeners();
  }

  Future<void> register(String email, String password) async {
    _user = await AuthService().register(email, password);
    notifyListeners();
  }

  Future<void> logout() async {
    await AuthService().logout();
    _user = null;
    notifyListeners();
  }
}
