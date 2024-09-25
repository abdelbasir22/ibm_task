part of 'messages_cubit.dart';

@immutable
sealed class MessagesState {}

final class MessagesInitial extends MessagesState {}

final class MessagesLoading extends MessagesState {}

final class MessagesLoaded extends MessagesState {
  final List<MessagesModel> messages;

  MessagesLoaded({required this.messages});
}

final class MessagesFaluier extends MessagesState {
  final String error;

  MessagesFaluier({required this.error});
}

class MessagesSearchUpdated extends MessagesState {
  final List<MessagesModel> searchResults;

  MessagesSearchUpdated({required this.searchResults});
}
