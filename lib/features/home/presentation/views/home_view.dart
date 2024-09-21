import 'package:flutter/material.dart';
import 'package:ibm_task/core/utils/app_colors.dart';
import 'package:ibm_task/features/active/presentation/views/active_view.dart';
import 'package:ibm_task/features/calls/presentation/views/calls_view.dart';
import 'package:ibm_task/features/groups/presentation/views/groups_view.dart';
import 'package:ibm_task/features/home/presentation/views/widgets/custom_log_out_button.dart';
import 'package:ibm_task/features/messages/presentation/views/messages_view.dart';

import '../../../../core/widgets/custom_search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/male.png'),
          ),
          title: const CustomSearchBar(),
          actions: const [
            CustomLogOutButton(),
          ],
          bottom: const TabBar(
            indicatorColor: AppColors.blue,
            labelColor: AppColors.blue,
            tabs: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Messages',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Active',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Groups',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Calls',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MessagesView(),
            ActiveView(),
            GroupsView(),
            CallsView(),
          ],
        ),
      ),
    );
  }
}
