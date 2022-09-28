import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_instagram/constants/constants.dart';
import 'package:flutter_application_instagram/screens/main_screen.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorblack,
      body: Column(
        children: [
          Expanded(
              child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/switch_account_background.png'),
                  ),
                ),
              ),
              Positioned(
                top: 220,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                    child: Container(
                      width: 340,
                      height: 352,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.5),
                              Color.fromRGBO(255, 255, 255, 0.2),
                            ]),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 25),
                          SizedBox(
                            height: 130,
                            width: 130,
                            child: Image.asset('images/user.png'),
                          ),
                          SizedBox(height: 25),
                          Text(
                            'MehdiKeshavrz',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(height: 25),
                          SizedBox(
                            height: 46,
                            width: 129,
                            child: ElevatedButton(
                              style:
                                  Theme.of(context).elevatedButtonTheme.style,
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MainScreen();
                                }));
                              },
                              child: Text(
                                'Contnue',
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                          Text(
                            'SwitchAccount',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
          Padding(
            padding: EdgeInsets.only(top: 132, bottom: 63),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'don\'t hava an account? /',
                  style: TextStyle(
                      color: Colors.grey, fontSize: 18, fontFamily: 'GB'),
                ),
                Text(
                  ' sign up',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: 'GB'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
