import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/features/profile/domain/entities/user.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.profile,
  });

  final User profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.network(
            profile.profilePhoto,
            fit: BoxFit.cover,
            width: 150,
            height: 150,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          profile.fullName,
          style: AppTextStyle.xLargeWhite,
        ),
        Text(
          '@${profile.userName}',
          style: AppTextStyle.largeWhite.copyWith(
            color: Color(0xFF99A1AF),
          ),
        ),
        Text(
          'Member since${profile.joined}',
          style: AppTextStyle.mediumWhite.copyWith(
            color: Color(0XFF6A7282),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}