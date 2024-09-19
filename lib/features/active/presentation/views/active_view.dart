import 'package:flutter/material.dart';
import 'package:ibm_task/features/active/presentation/views/widgets/active_view_body.dart';

class ActiveView extends StatelessWidget {
  const ActiveView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ActiveViewBody(),
    );
  }
}
