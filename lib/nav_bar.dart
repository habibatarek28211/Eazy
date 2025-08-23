import 'package:eazy/core/config/app_palette.dart';
import 'package:eazy/features/home/presentation/Screens/home.dart';
import 'package:eazy/features/myLessons/presentation/screens/myLessons_screen.dart';
import 'package:eazy/features/profile/presentation/screen/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _currentIndex = 1; // Start with home (middle) selected

  // Icons for the side navigation (excluding home)
  final iconList = <IconData>[
    Icons.menu_book_outlined,
    Icons.person_rounded,
  ];

  // Labels for bottom navigation
  final labels = ['دروسي', 'الرئيسية', 'حسابي'];
  final List<Widget> _pages = const [
    MyLessonsScreen(), // index 0
    HomeScreen(), // index 1
    ProfileScreen(), // index 2
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: _pages[_currentIndex],
      // ✅ شكل الهوم (الدائرة الملونة والأيقونة بيضاء)
      floatingActionButton: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentIndex == 1 ? AppPalette.badgeButton : Colors.black,
          boxShadow: [
            BoxShadow(
              color:
                  (_currentIndex == 1 ? AppPalette.badgeButton : Colors.black)
                      .withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Icon(
            Icons.home,
            size: 30,
            color: Colors.white, // ✅ الأبيض دايمًا
          ),
          onPressed: () {
            setState(() {
              _currentIndex = 1; // Home
            });
          },
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (index, isActive) {
          int actualIndex = index == 0 ? 0 : 2;
          bool isCurrentActive = _currentIndex == actualIndex;

          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                color: isCurrentActive ? AppPalette.badgeButton : Colors.black,
              ),
              Text(
                labels[actualIndex],
                style: TextStyle(
                  color:
                      isCurrentActive ? AppPalette.badgeButton : Colors.black,
                ),
              ),
            ],
          );
        },
        activeIndex: _getActiveIndex(),
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _currentIndex = index == 0 ? 0 : 2;
          });
        },
      ),
    );
  }

  int _getActiveIndex() {
    if (_currentIndex == 1) return -1;
    return _currentIndex == 0 ? 0 : 1;
  }
}
