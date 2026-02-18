import 'package:cinetrack/core/router/app_routes.dart';
import 'package:cinetrack/core/utils/show_snack.dart';
import 'package:cinetrack/features/profile/domain/entities/user.dart';
import 'package:cinetrack/features/profile/presentation/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0X30364153)),
        borderRadius: BorderRadius.circular(24),
        color: Color(0X301E2939),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MenuItem(
            icon: Icons.edit,
            label: 'Edit Profile',
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.editProfile,
                arguments: user,
              );
            },
          ),
          const Divider(color: Color(0X50364153)),
          MenuItem(
            icon: Icons.notifications_none,
            label: 'Notifications',
            onTap: () {
              showSnack(context, 'Cooming Soon');
            },
          ),
          const Divider(color: Color(0X50364153)),
          MenuItem(
            icon: Icons.privacy_tip_outlined,
            label: 'Privacy',
            onTap: () {
              showSnack(context, 'Cooming Soon');
            },
          ),
          const Divider(color: Color(0X50364153)),
          MenuItem(
            icon: Icons.help_outline,
            label: 'Help & Support',
            onTap: () {
              showSnack(context, 'Cooming Soon');
            },
          ),
          const Divider(color: Color(0X50364153)),
          MenuItem(
            icon: Icons.settings,
            label: 'Settings',
            onTap: () {
              showSnack(context, 'Cooming Soon');
            },
          ),
        ],
      ),
    );
  }
}
