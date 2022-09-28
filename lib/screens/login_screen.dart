import 'package:flutter/material.dart';
import 'package:flutter_application_instagram/constants/constants.dart';
import 'package:flutter_application_instagram/screens/switch_account_screen.dart';

class LogiScreen extends StatefulWidget {
  LogiScreen({Key? key}) : super(key: key);

  @override
  State<LogiScreen> createState() => _LogiScreenState();
}

class _LogiScreenState extends State<LogiScreen> {
  FocusNode myfocusnode1 = new FocusNode();
  FocusNode myfocusnode2 = new FocusNode();

  @override
  void initState() {
    super.initState();
    myfocusnode1.addListener(() {
      setState(() {});
    });
    myfocusnode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff323A99),
            Color(0xffF98BFC),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getImageContainer(),
            _getContainerBox(),
          ],
        ),
      ),
    );
  }

  Widget _getContainerBox() {
    return Column(
      children: [
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColorblack,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                SizedBox(width: double.infinity),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign in to ',
                      style: TextStyle(
                          fontFamily: 'GB', fontSize: 20, color: Colors.white),
                    ),
                    Image.asset('images/mood.png')
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    focusNode: myfocusnode1,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: myfocusnode1.hasFocus ? pinkColor : grayColor,
                          fontFamily: 'GM'),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(color: grayColor, width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(color: pinkColor, width: 3),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    focusNode: myfocusnode2,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: myfocusnode2.hasFocus ? pinkColor : grayColor,
                          fontFamily: 'GM'),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(color: grayColor, width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(color: pinkColor, width: 3),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 46,
                  width: 129,
                  child: ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SwitchAccountScreen();
                      }));
                    },
                    child: Text('Sign in'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _getImageContainer() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 60,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/rocket.png'), fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    myfocusnode1.dispose();
    myfocusnode2.dispose();
    super.dispose();
  }
}
