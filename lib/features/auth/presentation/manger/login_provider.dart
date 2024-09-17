// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'package:ibm_task/core/utils/app_url.dart';

// import '../../data/login_model.dart';

// class LoginProvider with ChangeNotifier {
//   bool _isLoading = false;
//   bool _isLoggedIn = false;

//   bool get isLoading => _isLoading;
//   bool get isLoggedIn => _isLoggedIn;

//   Future<bool> login({required String email, required String password}) async {
//     _isLoading = true;
//     notifyListeners();

//     // final Uri url = Uri.parse('${AppUrl.loginUrl}');
//     final response = await http.post(Uri.parse(AppUrl.loginUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: LoginModel(email: email, password: password).toJson());

//     if (response.statusCode == 200) {
//       // Handle successful login (e.g., store token, navigate to home)
//       _isLoggedIn = true;
//       notifyListeners();
//       return true;
//     } else {
//       // Handle login failure (e.g., show error message)
//       print('Login failed: ${response.statusCode}');
//       _isLoading = false;
//       notifyListeners();
//       return false;
//     }
//   }
// }

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
