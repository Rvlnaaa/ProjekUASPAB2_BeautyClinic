import 'package:flutter/material.dart';

import '../main.dart';
import '../screens/favorite/favorite_page.dart';
import '../screens/home/home_page.dart';
import '../screens/news/news_page.dart';
import '../screens/profile/profile_page.dart';

class BottomNavbar extends StatefulWidget {
  BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() =>
      _BottomNavbarState();
}

class _BottomNavbarState
    extends State<BottomNavbar> {

  int currentIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const FavoritePage(),
    const NewsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: isEnglishNotifier,

      builder: (
        context,
        bool isEnglish,
        child,
      ) {

        return Scaffold(
          body: pages[currentIndex],

          bottomNavigationBar:
              BottomNavigationBar(
            currentIndex: currentIndex,

            onTap: (index) {

              setState(() {
                currentIndex = index;
              });
            },

            selectedItemColor:
                Colors.amber,

            unselectedItemColor:
                Colors.grey,

            type:
                BottomNavigationBarType
                    .fixed,

            items: [

              BottomNavigationBarItem(
                icon:
                    const Icon(Icons.home),

                label: isEnglish
                    ? 'Home'
                    : 'Beranda',
              ),

              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.favorite,
                ),

                label: isEnglish
                    ? 'Favorite'
                    : 'Favorit',
              ),

              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.article,
                ),

                label: isEnglish
                    ? 'News'
                    : 'Berita',
              ),

              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.person,
                ),

                label: isEnglish
                    ? 'Profile'
                    : 'Profil',
              ),
            ],
          ),
        );
      },
    );
  }
}