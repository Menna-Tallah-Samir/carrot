import 'package:carrot_app/Authentication/auth.dart';
import 'package:carrot_app/profile/list_component.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class ProfileComponent extends StatelessWidget {
  String title = '';
  var beginning = [];
  var text = [];
  var ending = [];

  ProfileComponent(this.title, this.beginning, this.text, this.ending);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 18),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: text.length,
              itemBuilder: ((context, index) {
                if (ending[index] == true) {
                  return SwitchListTile(
                    activeColor: Colors.white,
                    activeTrackColor:Colors.green,
                    value: true,
                    onChanged: (value) => !value,
                    title: Text(
                      text[index],
                      style: TextStyle(color: HexColor('#828282')),
                    ),
                    secondary: beginning[index],
                  );
                }
                return GestureDetector(
                  child: listComponent(
                      beginning[index], text[index], ending[index]),
                  onTap: () {
                    if (text[index] == 'Logout') {
                      context.read<AuthService>().signOut();
                    }
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
