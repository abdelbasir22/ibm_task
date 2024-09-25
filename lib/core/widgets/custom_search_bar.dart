import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/messages/presentation/manger/messages_cubit/messages_cubit.dart';
import '../utils/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: TextField(
            onChanged: (query) {
              BlocProvider.of<MessagesCubit>(context).searchMessages(query);
            },
            decoration: InputDecoration(
              hintText: 'Search ...',
              hintStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.black.withOpacity(.6),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.black.withOpacity(.6),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    const BorderSide(width: 1, color: AppColors.blueGray),
              ),
              filled: true,
              fillColor: AppColors.grey.withOpacity(.3),
            ),
          ),
        ),
      ),
    );
  }
}
