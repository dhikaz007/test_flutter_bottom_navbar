import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'course_page.dart';
import 'faq_page.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'scroll_to_hide_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static final ScrollController _scrollController = ScrollController();

  static final List<Widget> _widgetOptions = [
    HomePage(scrollController: _scrollController),
    const CoursePage(),
    const FaqPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> selectedIndex = ValueNotifier(0);
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (context, selectedIndexValue, _) => Scaffold(
        body: _widgetOptions.elementAt(selectedIndexValue),
        bottomNavigationBar: ScrollToHideWidget(
          scrollController: _scrollController,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/home_icon.svg',
                  width: 24,
                  height: 24,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/home_fill_icon.svg',
                  width: 24,
                  height: 24,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/course_icon.svg',
                  width: 24,
                  height: 24,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/course_fill_icon.svg',
                  width: 24,
                  height: 24,
                ),
                label: 'Course',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/faq_icon.svg',
                  width: 24,
                  height: 24,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/faq_fill_icon.svg',
                  width: 24,
                  height: 24,
                ),
                label: 'FAQ',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/profile_icon.svg',
                  width: 24,
                  height: 24,
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: selectedIndexValue,
            selectedItemColor: Colors.blue[900],
            unselectedItemColor: Colors.blue[900],
            showUnselectedLabels: true,
            onTap: (index) => selectedIndex.value = index,
          ),
        ),
      ),
    );
  }
}
