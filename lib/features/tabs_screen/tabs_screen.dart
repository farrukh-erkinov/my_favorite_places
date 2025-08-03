import 'package:flutter/material.dart';
import 'package:surf_places/assets/strings/app_strings.dart';
import 'package:surf_places/features/favorites/favorites_screen.dart';
import 'package:surf_places/features/places/ui/screens/places_screen_builder.dart';
import 'package:surf_places/features/settings/settings_screen.dart';
import 'package:surf_places/uikit/images/svg_picture_widget.dart';

/// Экран с табами.
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const PlacesScreenBuilder(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: SvgPictureWidget('assets/icons/list.svg'),
            activeIcon: SvgPictureWidget('assets/icons/list_full.svg'),
            label: AppStrings.placesScreenBottomNavPlaces,
          ),
          BottomNavigationBarItem(
            icon: SvgPictureWidget('assets/icons/heart.svg'),
            activeIcon: SvgPictureWidget('assets/icons/heart_full.svg'),
            label: AppStrings.placesScreenBottomNavFavorites,
          ),
          BottomNavigationBarItem(
            icon: SvgPictureWidget('assets/icons/settings.svg'),
            activeIcon: SvgPictureWidget('assets/icons/settings_full.svg'),
            label: AppStrings.placesScreenBottomNavSettings,
          ),
        ],
      ),
    );
  }
}
