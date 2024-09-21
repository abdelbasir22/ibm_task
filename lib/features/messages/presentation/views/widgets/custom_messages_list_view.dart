import 'package:flutter/material.dart';
import 'package:ibm_task/features/messages/presentation/manger/messages_provider.dart';
import 'package:ibm_task/features/messages/presentation/views/widgets/custom_list_tile.dart';
import 'package:provider/provider.dart';

class CustomMessagesListView extends StatelessWidget {
  const CustomMessagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final messagesProvider = Provider.of<MessagesProvider>(context);

    return SliverList.builder(
      itemCount: messagesProvider.messages.length,
      itemBuilder: (context, index) {
        return CustomListTile(
          messages: messagesProvider.messages[index],
        );
      },
    );
  }
}
