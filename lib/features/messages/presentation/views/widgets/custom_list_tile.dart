import 'package:flutter/material.dart';

import '../../../data/models/messages_model/messages_model.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.messages,
  });

  final MessagesModel messages;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 22,
        backgroundImage: AssetImage(
          'assets/images/male.png',
        ),
      ),
      title: Text(
        messages.userName ?? 'Mohamed Ahmed',
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        messages.message ?? 'Hi',
        style: const TextStyle(fontSize: 16),
      ),
      trailing: Text(
        messages.time ?? 'Fri',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}



//  Container(
//         width: 50,
//         height: 50,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: Image.network(
//           messages.image ?? 'https://images.app.goo.gl/aLDodRouWGLaC3v8A',
//           height: 50,
//           width: 50,
//           fit: BoxFit.fill,
//         ),