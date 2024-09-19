import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(vertical: 15),
      childrenPadding: const EdgeInsets.only(left: 55, bottom: 15),
      leading: const CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(
          'assets/images/logo.png',
        ),
      ),
      title: const ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text(
          'Original Coast Clothing',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
        ),
        subtitle: Text(
          'Fall favorits are in , Find your next go-to sweater today',
          style: TextStyle(fontSize: 15, color: AppColors.grey),
        ),
      ),
      children: [
        Column(
          children: [
            Image.asset('assets/images/logo 2.1.png'),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Free shipping on any \npurchase \$20',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.darGgrey,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(width: 1, color: AppColors.blue)),
                  onPressed: () {},
                  child: const Text(
                    'SHOP NOW',
                    style: TextStyle(color: AppColors.blue, fontSize: 18),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
