import 'package:carrot_app/cart/cart_screen.dart';
import 'package:carrot_app/main.dart';
import 'package:carrot_app/mainPage/home_screen.dart';
import 'package:carrot_app/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    HomePage(),
    Profile(),
  ];

  Widget _selectedScreen = HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _selectedScreen,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
            print('current' + _selectedIndex.toString());
            print('value' + value.toString());
            if (_selectedIndex != value) {
              if (value == 2) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              } else {
                setState(() {
                  this._selectedIndex = value;
                  if (_selectedIndex == 0) {
                    _selectedScreen = screens[0];
                  } else if (_selectedIndex == 4) {
                    _selectedScreen = screens[1];
                  }
                });
              }
            }
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          selectedLabelStyle: TextStyle(color: Colors.green),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/home.png'),
                label: 'Home',
                activeIcon: Image.asset('assets/images/active_home.png')),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/search.png'), label: 'Search'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/cart.png'), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/campaign.png'),
                label: 'Campaigns'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/profile.png'),
                label: 'Profile',
                activeIcon: Image.asset('assets/images/active_profile.png')),
          ],
        ));
  }
}
