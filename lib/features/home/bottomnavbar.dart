import 'package:flutter/material.dart';
import '../../Core/appColors.dart';
import '../../Core/apptext.dart';
import 'account_page.dart';
import 'chat_page.dart';
import 'course_page.dart';
import 'home_page.dart';
import 'search_page.dart';

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
          resizeToAvoidBottomInset: false, // Prevents floating action button from moving up
          body: _pages[_selectedIndex], // Display selected page

          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashFactory: NoSplash.splashFactory, // Removes splash effect
              highlightColor: Colors.transparent, // Removes highlight effect
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
                    icon: SizedBox.shrink(), // Empty space for FAB
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat, size: 22),
                    label: "Message",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person, size: 22),
                    label: "Profile",
                  ),
                ],
              ),
            ),
          ),
        ),

        // Floating Action Button outside Scaffold to keep it static
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 2 - 28, // Center FAB
          child: FloatingActionButton(
            backgroundColor: AppColors.theme,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
            shape: CircleBorder(side: BorderSide(color: Colors.grey)),
            child: Icon(Icons.search, color: Colors.grey, size: 28),
          ),
        ),
      ],
    );
  }
}
