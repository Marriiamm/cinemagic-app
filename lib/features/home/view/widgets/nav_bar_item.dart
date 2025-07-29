import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.notchBottomBarController,
    required this.onTap,
  });

  final NotchBottomBarController notchBottomBarController;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedNotchBottomBar(
      onTap: onTap,
      kIconSize: 24,
      kBottomRadius: 30,
      notchBottomBarController: notchBottomBarController,
      color: Colors.white10,
      showShadow: false,
      notchColor: red,
      bottomBarItems: const [
        BottomBarItem(
          inActiveItem: Icon(Icons.home_filled, color: Colors.grey),
          activeItem: Icon(Icons.home_filled, color: Colors.white),
          itemLabel: 'Home',
        ),
        BottomBarItem(
          inActiveItem: Icon(Icons.movie_creation, color: Colors.grey),
          activeItem: Icon(Icons.movie_creation, color: Colors.white),
          itemLabel: 'Categories',
        ),
        BottomBarItem(
          inActiveItem: Icon(
            size: 20,
            FontAwesomeIcons.ticketSimple,
            color: Colors.grey,
          ),
          activeItem: Icon(size: 20, FontAwesomeIcons.ticketSimple, color: Colors.white),
          itemLabel: 'Bookings',
        ),
        BottomBarItem(
          inActiveItem: Icon(
            size: 22,
            FontAwesomeIcons.solidUser,
            color: Colors.grey,
          ),
          activeItem: Icon(FontAwesomeIcons.solidUser, color: Colors.white),
          itemLabel: 'Profile',
        ),
      ],
    );
  }
}
