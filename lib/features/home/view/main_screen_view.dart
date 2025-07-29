import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:test_splashh/features/profile/view/profile_view.dart';

import '../../../../core/utils/constants.dart';
import '../../bookings/views/bookings_view.dart';
import '../../categories/view/categories_view.dart';
import 'home_view.dart';
import 'widgets/nav_bar_item.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({super.key});

  @override
  State<MainScreenView> createState() => _HomeViewState();
}

class _HomeViewState extends State<MainScreenView> {
  late final PageController _pageController;
  late final NotchBottomBarController _notchBottomBarController;
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePageContent(),
    const CategoriesView(),
    const BookingsView(),
    const ProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _notchBottomBarController = NotchBottomBarController(index: 0);

    _pageController.addListener(() {
      if (_pageController.page?.round() != _currentIndex) {
        setState(() {
          _currentIndex = _pageController.page!.round();
          _notchBottomBarController.index = _currentIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _notchBottomBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(
          notchBottomBarController: _notchBottomBarController,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            });
          },
        ),
        backgroundColor: black,
        body: PageView(controller: _pageController, children: _pages),
      ),
    );
  }
}
