import 'package:flutter/material.dart';
import 'package:ibm_task/features/messages/presentation/views/widgets/messages_view_body.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MessagesViewBody(),
    );
  }
}
