import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomSocialMediaRow extends StatelessWidget {
  const CustomSocialMediaRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.darkBlue,
          child: Icon(
            FontAwesomeIcons.facebookF,
            color: AppColors.white,
            size: 20,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.orange,
          child: Icon(
            FontAwesomeIcons.google,
            size: 20,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.blue,
          child: Icon(
            FontAwesomeIcons.twitter,
            size: 20,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
