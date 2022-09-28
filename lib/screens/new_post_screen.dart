import 'package:flutter/material.dart';
import 'package:flutter_application_instagram/constants/constants.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorblack,
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _getRowHeader()),
              SliverToBoxAdapter(child: _getImageContainer()),
              SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset('images/item$index.png'),
                      ),
                    ),
                  );
                }, childCount: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),
              SliverPadding(padding: EdgeInsets.only(bottom: 100))
            ],
          ),
          Container(
            height: 83,
            decoration: BoxDecoration(
              color: backgroundColorblack,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Draft',
                    style: TextStyle(
                        fontFamily: 'GB', fontSize: 16, color: pinkColor),
                  ),
                  Text(
                    'Gallery',
                    style: TextStyle(
                        fontFamily: 'GB', fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'Take',
                    style: TextStyle(
                        fontFamily: 'GB', fontSize: 16, color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget _getImageContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: double.infinity,
      height: 375,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset('images/post_cover1.png'),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  Widget _getRowHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        children: [
          Text(
            'post',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'GB',
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          SizedBox(width: 10),
          Image.asset('images/icon_arrow_down.png'),
          Spacer(),
          Text(
            'Next',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'GB',
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          SizedBox(width: 10),
          Image.asset('images/icon_arrow_right_box.png')
        ],
      ),
    );
  }
}
