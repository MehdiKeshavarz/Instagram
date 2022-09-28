import 'package:flutter/material.dart';
import 'package:flutter_application_instagram/screens/actaivity_screen.dart';
import 'package:flutter_application_instagram/screens/home_screen.dart';
import 'package:flutter_application_instagram/screens/login_screen.dart';
import 'package:flutter_application_instagram/screens/main_screen.dart';
import 'package:flutter_application_instagram/screens/new_post_screen.dart';
import 'package:flutter_application_instagram/screens/search_screen.dart';
import 'package:flutter_application_instagram/screens/splash_screen.dart';
import 'package:flutter_application_instagram/screens/switch_account_screen.dart';
import 'package:flutter_application_instagram/screens/user_profile_screen.dart';

import 'constants/constants.dart';

void main() {
  runApp(Appliction());
}

class Appliction extends StatelessWidget {
  const Appliction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
            headline4: TextStyle(
                fontFamily: 'GB',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
                fontFamily: 'GB', fontSize: 16, fontWeight: FontWeight.w700),
            primary: pinkColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LogiScreen(),
    );
  }
}
