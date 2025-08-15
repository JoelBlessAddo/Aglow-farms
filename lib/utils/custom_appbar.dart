import 'package:aglow_farms/features/profile/view/profile_page.dart';
import 'package:aglow_farms/utils/colors.dart';
import 'package:aglow_farms/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Aglow Farms',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: BLACK,
            ),
          ),
          Text('Good afternoon', style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton.filledTonal(
                icon: Icon(IconlyBroken.profile, size: 28),
                onPressed: () {
                  customNavigator(context, ProfileManagementPage());
                },
              ),
            ],
          ),
        ),
      ],
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: const AssetImage('assets/logo.png'),
        ),
      ),
    );
  }
}
