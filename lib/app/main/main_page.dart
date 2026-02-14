import 'package:cinetrack/app/main/cubit/main_cubit.dart';
import 'package:cinetrack/core/styles/app_colors.dart';
import 'package:cinetrack/core/widget/app_background.dart';
import 'package:cinetrack/features/home/presentation/pages/home_page.dart';
import 'package:cinetrack/features/movie/presentation/pages/search_movie_page.dart';
import 'package:cinetrack/features/profile/presentation/pages/profile_page.dart';
import 'package:cinetrack/features/watched/presentation/pages/watched_movie_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  final List<Widget> _pages = const [
    HomePage(),
    SearchMoviePage(),
    WatchedMoviePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainCubit(),
      child: BlocBuilder<MainCubit, int>(
        builder: (context, currentIndex) {
          return AppBackground(
            child: Scaffold(
              body: IndexedStack(index: currentIndex, children: _pages),

              bottomNavigationBar: BottomNavigationBar(
                currentIndex: currentIndex,
                type: BottomNavigationBarType.shifting,
                selectedItemColor: AppColors.softPurple,
                unselectedItemColor: AppColors.gray,

                onTap: (index) {
                  context.read<MainCubit>().changePage(index);
                },

                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: "Home",
                    backgroundColor: Color(0xFF101828),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: "Search",
                    backgroundColor: Color(0xFF101828),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: "Watched",
                    backgroundColor: Color(0xFF101828),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "Profile",
                    backgroundColor: Color(0xFF101828),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
