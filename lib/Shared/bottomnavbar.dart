import 'package:flutter/material.dart';
import '../Core/appColors.dart';
import '../Core/apptext.dart';
import '../features/home/account_page.dart';
import '../features/home/chat_page.dart';
import '../features/home/course_page.dart';
import '../features/home/home_page.dart';
import '../features/home/search_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    CoursePage(),
    Container(),
    ChatPage(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: _pages[_selectedIndex],

          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    spreadRadius: 1,
                    offset: Offset(0, -2), // Shadow on top of navbar
                  ),
                ],
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                selectedLabelStyle: AppText.navSelectedLabelTextStyle(),
                unselectedLabelStyle: AppText.navUnSelectedLabelTextStyle(),
                selectedItemColor: AppColors.bgColor,
                unselectedItemColor: Colors.black,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                elevation: 0,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: 22),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu_book, size: 22),
                    label: "Course",
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox.shrink(),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat, size: 22),
                    label: "Message",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person, size: 22),
                    label: "Account",
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 2 - 28,
          child: FloatingActionButton(
            backgroundColor: AppColors.theme,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
            shape: CircleBorder(side: BorderSide(color: Colors.grey)),
            child: Icon(Icons.search, color: Colors.black, size: 28),
          ),
        ),
      ],
    );
  }
}
