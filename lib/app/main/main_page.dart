import 'package:cinetrack/app/main/cubit/cubit.dart';
import 'package:cinetrack/core/styles/app_colors.dart';
import 'package:cinetrack/core/widget/app_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  final List<Widget> _pages = const [
    Center(child: Text("Home Page")),
    Center(child: Text("Search Page")),
    Center(child: Text("Favorites Page")),
    Center(child: Text("Profile Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainCubit(),
      child: BlocBuilder<MainCubit, int>(
        builder: (context, currentIndex) {
          return AppBackground(
            child: Scaffold(
              body: _pages[currentIndex],

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
