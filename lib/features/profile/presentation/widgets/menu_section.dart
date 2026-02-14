import 'package:cinetrack/features/profile/presentation/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({
    super.key,
  });

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
          ),
          const Divider(color: Color(0X50364153)),
          MenuItem(
            icon: Icons.notifications_none,
            label: 'Notifications',
          ),
          const Divider(color: Color(0X50364153)),
          MenuItem(
            icon: Icons.privacy_tip_outlined,
            label: 'Privacy',
          ),
          const Divider(color: Color(0X50364153)),
          MenuItem(
            icon: Icons.help_outline,
            label: 'Help & Support',
          ),
          const Divider(color: Color(0X50364153)),
          MenuItem(
            icon: Icons.settings,
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}