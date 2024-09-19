import 'package:flutter/material.dart';
import 'package:ibm_task/features/messages/presentation/views/widgets/custom_list_tile.dart';

class CustomMessagesListView extends StatelessWidget {
  const CustomMessagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 22,
      itemBuilder: (context, index) {
        return const CustomListTile(
          imageUrl: 'https://images.app.goo.gl/aLDodRouWGLaC3v8A',
          title: 'Mohamed Ahmed',
          subTitle: 'How are you ?',
          day: 'Fri',
        );
      },
    );
  }
}
