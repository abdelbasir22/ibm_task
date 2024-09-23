import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ibm_task/core/utils/app_url.dart';
import 'dart:convert';

import '../../data/models/messages_model/messages_model.dart';

class MessagesProvider extends ChangeNotifier {
  List<MessagesModel> _messages = [];
  List<MessagesModel> _searchResults = [];

  List<MessagesModel> get messages => _messages;
  List<MessagesModel> get searchResults => _searchResults;

  Future<void> fetchMessages() async {
    final response = await http.get(Uri.parse(AppUrl.messagesUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      _messages =
          jsonResponse.map((data) => MessagesModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load messages');
    }
    notifyListeners();
  }

  void searchMessages(String query) {
    if (query.isEmpty) {
      _searchResults = _messages;
    } else {
      _searchResults = _messages
          .where((message) =>
              message.userName!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
