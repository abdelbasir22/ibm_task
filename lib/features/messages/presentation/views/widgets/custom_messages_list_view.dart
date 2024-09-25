import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibm_task/features/messages/presentation/views/widgets/custom_list_tile.dart';

import '../../../data/models/messages_model/messages_model.dart';
import '../../manger/messages_cubit/messages_cubit.dart';

class CustomMessagesListView extends StatelessWidget {
  const CustomMessagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesCubit, MessagesState>(
      builder: (context, state) {
        List<MessagesModel> messages;

        if (state is MessagesLoading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(74),
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state is MessagesLoaded) {
          messages = state.messages;
        } else if (state is MessagesSearchUpdated) {
          messages = state.searchResults;
        } else {
          messages = [];
        }

        if (messages.isEmpty) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'No results found. Please try a different search.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ),
          );
        }

        return SliverList.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            return CustomListTile(
              messages: messages[index],
            );
          },
        );
      },
    );
  }
}
