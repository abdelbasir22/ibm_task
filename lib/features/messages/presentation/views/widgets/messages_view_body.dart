import 'package:flutter/material.dart';
import 'package:ibm_task/features/messages/presentation/views/widgets/custom_messages_list_view.dart';
import 'package:ibm_task/features/messages/presentation/views/widgets/expansion_tile_widget.dart';
import 'package:provider/provider.dart';

import '../../manger/messages_provider.dart';

class MessagesViewBody extends StatelessWidget {
  const MessagesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final messagesProvider = Provider.of<MessagesProvider>(context);
    messagesProvider.fetchMessages();

    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sponsored",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  ExpansionTileWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'More Conversations',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        ),
        CustomMessagesListView(),
      ],
    );
  }
}
