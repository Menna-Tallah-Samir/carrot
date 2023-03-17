import 'package:carrot_app/widgets/main_screen.dart';
import 'package:carrot_app/profile/list_component.dart';
import 'package:carrot_app/profile/profile_component.dart';
import 'package:flutter/material.dart';
import 'package:carrot_app/Authentication/auth.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hexcolor/hexcolor.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile';

  Profile({Key? key}) : super(key: key);

  var first = [Icons.person];
  var title = ['Edit Profile'];
  var last = [Icon(Icons.arrow_right)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Profile', style: TextStyle(color: Colors.black)),
        shadowColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 160,
              child: ProfileComponent(
                  'Account',
                  [ImageIcon(AssetImage('assets/images/user.png')), 
                  ImageIcon(AssetImage('assets/images/key.png'))],
                  ['Edit Profile', 'Change Password'],
                  [Icon(Icons.keyboard_arrow_right_outlined), Icon(Icons.keyboard_arrow_right_outlined)]),
            ),
            SizedBox(
              height: 270,
              child: ProfileComponent('General', [
                ImageIcon(AssetImage('assets/images/orders.png')),
                Icon(Icons.favorite),
                ImageIcon(AssetImage('assets/images/address.png')),
                ImageIcon(AssetImage('assets/images/card.png'))
              ], [
                'Orders',
                'Favorites',
                'My Addresses',
                'My Card'
              ], [
                Icon(Icons.keyboard_arrow_right_outlined),
                Icon(Icons.keyboard_arrow_right_outlined),
                Icon(Icons.keyboard_arrow_right_outlined),
                Icon(Icons.keyboard_arrow_right_outlined)
              ]),
            ),
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: ProfileComponent(
                'App Settings',
                [ImageIcon(AssetImage('assets/images/notification.png')), 
                ImageIcon(AssetImage('assets/images/mood.png')), 
                ImageIcon(AssetImage('assets/images/language.png')), 
                ImageIcon(AssetImage('assets/images/logout.png'))],
                ['Notifications', 'Dark Mood', 'Language', 'Logout'],
                [ true, true,Row(mainAxisSize: MainAxisSize.min,
                  children: [
                  Text('English', style: TextStyle(fontSize: 16, color: HexColor('#828282')),),
                  Icon(Icons.keyboard_arrow_right_outlined,)
                ],),
                  Text('')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
