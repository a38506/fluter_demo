import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:temp_project/features.dart';
import 'package:temp_project/features/bag_page.dart';
import 'package:temp_project/features/favorites_page.dart';
import 'package:temp_project/features/profile_page.dart';
import 'package:temp_project/features/shop_page.dart';
import 'package:temp_project/theme/app_icons.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        children: const <Widget>[
          HomePage(),
          ShopPage(),
          BagPage(),
          FavoritesPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: kElevationToShadow[6],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              _pageController.jumpToPage(index);
              setState(() => _currentIndex = index);
            },
            backgroundColor: Colors.white,
            selectedItemColor: colorScheme.secondary,
            unselectedItemColor: Theme.of(context).hintColor,
            selectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.secondary,
                ),
            unselectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w300,
                ),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.homeInactive,
                  color: _currentIndex == 0
                      ? colorScheme.secondary
                      : Theme.of(context).hintColor,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.shop,
                  color: _currentIndex == 1
                      ? colorScheme.secondary
                      : Theme.of(context).hintColor,
                ),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.bag,
                  color: _currentIndex == 2
                      ? colorScheme.secondary
                      : Theme.of(context).hintColor,
                ),
                label: 'Bag',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.favorite,
                  color: _currentIndex == 3
                      ? colorScheme.secondary
                      : Theme.of(context).hintColor,
                ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.profile,
                  color: _currentIndex == 4
                      ? colorScheme.secondary
                      : Theme.of(context).hintColor,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
