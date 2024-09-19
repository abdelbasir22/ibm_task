import 'package:flutter/material.dart';
import 'package:ibm_task/features/groups/presentation/views/widgets/groups_view_body.dart';

class GroupsView extends StatelessWidget {
  const GroupsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GroupsViewBody(),
    );
  }
}
