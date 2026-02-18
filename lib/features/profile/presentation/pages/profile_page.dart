import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/core/widget/app_background.dart';
import 'package:cinetrack/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:cinetrack/features/profile/presentation/bloc/profile/profile_state.dart';
import 'package:cinetrack/features/profile/presentation/widgets/fav_genre_section.dart';
import 'package:cinetrack/features/profile/presentation/widgets/header_section.dart';
import 'package:cinetrack/features/profile/presentation/widgets/log_out_section.dart';
import 'package:cinetrack/features/profile/presentation/widgets/menu_section.dart';
import 'package:cinetrack/features/profile/presentation/widgets/stats_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsGeometry.only(
              left: 16,
              right: 16,
              bottom: 32,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Profile', style: AppTextStyle.xxxLargeWhite),
                const SizedBox(height: 20),
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }

                    if (state is ProfileFailure) {
                      return Center(
                        child: Text(
                          state.error,
                          style: AppTextStyle.xLargeWhiteBold,
                        ),
                      );
                    }

                    if (state is ProfileSuccess) {
                      final profile = state.userData;

                      return SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HeaderSection(profile: profile),
                            const SizedBox(height: 20),
                            StatsSection(profile: profile),
                            const SizedBox(height: 20),
                            FavGenreSection(profile: profile),
                            const SizedBox(height: 20),
                            MenuSection(user: profile),
                            const SizedBox(height: 20),
                            LogOutSection(),
                          ],
                        ),
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}