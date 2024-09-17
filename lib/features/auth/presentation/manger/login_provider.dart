import 'package:flutter/material.dart';
import 'package:ibm_task/features/auth/presentation/manger/api_service.dart';

import '../../data/login_model.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;
  bool isLoading = false;

  UserModel? get user => _user;

  Future<void> login(String email, String password) async {
    isLoading = true;
    notifyListeners();

    try {
      final result = await ApiService().login(email, password);
      _user = UserModel.fromJson(result);
    } catch (e) {
      throw e;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
