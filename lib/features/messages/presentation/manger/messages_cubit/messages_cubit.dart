import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/utils/app_url.dart';
import '../../../data/models/messages_model/messages_model.dart';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit() : super(MessagesInitial());
  List<MessagesModel> _messages = [];
  List<MessagesModel> _searchResults = [];

  List<MessagesModel> get messages => _messages;
  List<MessagesModel> get searchResults => _searchResults;

  Future<void> fetchMessages() async {
    try {
      emit(MessagesLoading());
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final response = await http.get(Uri.parse(AppUrl.messagesUrl));
        if (response.statusCode == 200) {
          List jsonResponse = json.decode(response.body);
          _messages =
              jsonResponse.map((data) => MessagesModel.fromJson(data)).toList();
          emit(MessagesLoaded(messages: _messages));
        } else {
          emit(MessagesFaluier(error: 'There are some error'));
        }
      }
    } on SocketException catch (_) {
      emit(MessagesFaluier(error: 'There are some error'));
    }
  }

  void searchMessages(String query) {
    if (query.isEmpty) {
      _searchResults = _messages;
    } else {
      _searchResults = _messages
          .where((message) =>
              message.userName!.toLowerCase().contains(query.toLowerCase()) ||
              message.message!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(MessagesSearchUpdated(searchResults: _searchResults));
  }
}
