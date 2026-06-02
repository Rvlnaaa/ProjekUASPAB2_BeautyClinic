import 'package:flutter/material.dart';

import '../main.dart';
import '../screens/favorite/favorite_page.dart';
import '../screens/home/home_page.dart';
import '../screens/news/news_page.dart';
import '../screens/profile/profile_page.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

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

    return ValueListenableBuilder<String>(
      valueListenable: languageNotifier,

      builder: (
        context,
        String language,
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
                BottomNavigationBarType.fixed,

            items: [

              BottomNavigationBarItem(
                icon: const Icon(Icons.home),

                label:
                    language == 'id'
                        ? 'Beranda'
                        : language == 'en'
                            ? 'Home'
                            : 'ホーム',
              ),

              BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),

                label:
                    language == 'id'
                        ? 'Favorit'
                        : language == 'en'
                            ? 'Favorite'
                            : 'お気に入り',
              ),

              BottomNavigationBarItem(
                icon: const Icon(Icons.article),

                label:
                    language == 'id'
                        ? 'Berita'
                        : language == 'en'
                            ? 'News'
                            : 'ニュース',
              ),

              BottomNavigationBarItem(
                icon: const Icon(Icons.person),

                label:
                    language == 'id'
                        ? 'Profil'
                        : language == 'en'
                            ? 'Profile'
                            : 'プロフィール',
              ),
            ],
          ),
        );
      },
    );
  }
}