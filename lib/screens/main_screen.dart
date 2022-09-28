import 'package:flutter/material.dart';
import 'package:flutter_application_instagram/constants/constants.dart';
import 'package:flutter_application_instagram/screens/actaivity_screen.dart';
import 'package:flutter_application_instagram/screens/home_screen.dart';
import 'package:flutter_application_instagram/screens/new_post_screen.dart';
import 'package:flutter_application_instagram/screens/search_screen.dart';
import 'package:flutter_application_instagram/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _SelectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            backgroundColor: backgroundColorblack,
            type: BottomNavigationBarType.fixed,
            currentIndex: _SelectedItem,
            showSelectedLabels: false,
            onTap: (int index) {
              setState(() {
                _SelectedItem = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_home.png'),
                activeIcon: Image.asset('images/icon_active_home.png'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_search_navigation.png'),
                activeIcon:
                    Image.asset('images/icon_search_navigation_active.png'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_add_navigation.png'),
                activeIcon:
                    Image.asset('images/icon_add_navigation_active.png'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_activity_navigation.png'),
                activeIcon:
                    Image.asset('images/icon_activity_navigation_active.png'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: grayColor, width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('images/profile.png'),
                    ),
                  ),
                ),
                activeIcon: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: pinkColor, width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('images/profile.png'),
                    ),
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _SelectedItem,
        children: getLayout(),
      ),
    );
  }

  List<Widget> getLayout() {
    return <Widget>[
      HomeScreen(),
      SearchScreen(),
      NewPostScreen(),
      ActivityScreen(),
      UserProfile()
    ];
  }
}
