import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ibm_task/core/utils/app_url.dart';

class ApiService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse(AppUrl.loginUrl);
    try {
      final response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      rethrow;
    }
  }
}
