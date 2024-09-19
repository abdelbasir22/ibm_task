import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.day,
  });

  final String title;
  final String subTitle;
  final String imageUrl;
  final String day;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 22,
        backgroundImage: NetworkImage(
          imageUrl,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        subTitle,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: Text(
        day,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
