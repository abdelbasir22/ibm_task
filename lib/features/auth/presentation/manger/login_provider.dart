import 'package:flutter/material.dart';
import 'package:ibm_task/features/auth/presentation/manger/login_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/login_model.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  bool _isLoggedIn = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await LoginApiService().login(email, password);
      _user = UserModel.fromJson(result);
      _isLoggedIn = true;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userToken', _user!.token);

      notifyListeners();
    } catch (e) {
      throw e;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('userToken');
    if (token != null) {
      _isLoggedIn = true;
    } else {
      _isLoggedIn = false;
    }
    notifyListeners();
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userToken');
    _isLoggedIn = false;
    _user = null;
    notifyListeners();
  }
}
