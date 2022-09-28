import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_instagram/constants/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_application_instagram/screens/bottomsharesheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorblack,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: backgroundColorblack,
        elevation: 0,
        title: Container(
          width: 128,
          height: 24,
          child: Image.asset('images/moodinger_logo.png'),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 18),
            height: 24,
            width: 24,
            child: Image.asset('images/icon_direct.png'),
          )
        ],
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _getStoryList()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    _getHeaderPost(),
                    SizedBox(height: 24),
                    _getContentPost(context),
                  ],
                );
              },
              childCount: 10,
            ),
          )
        ],
      )),
    );
  }

  SizedBox _getStoryList() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return index == 0 ? _getAddStoryBox() : _getStoryFollowing();
          }),
    );
  }

  Widget _getContentPost(BuildContext context) {
    return Container(
      height: 440,
      width: 394,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('images/post_cover1.png'),
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Image.asset('images/icon_video.png'),
          ),
          Positioned(
            bottom: 35,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  width: 340,
                  height: 46,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromRGBO(255, 255, 255, 0.5),
                            Color.fromRGBO(255, 255, 255, 0.2),
                          ]),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/icon_hart.png'),
                          SizedBox(width: 6),
                          Text('2.5k',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'GB')),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('images/icon_comments.png'),
                          SizedBox(width: 6),
                          Text('1.5k',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'GB')),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              barrierColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: DraggableScrollableSheet(
                                      initialChildSize: 0.5,
                                      maxChildSize: 0.7,
                                      minChildSize: 0.2,
                                      builder: (context, controler) {
                                        return BottomShareSheet(
                                          controller: controler,
                                        );
                                      }),
                                );
                              });
                        },
                        child: Image.asset('images/icon_share.png'),
                      ),
                      Image.asset('images/icon_save.png')
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding _getHeaderPost() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          _getStoryBoxHeader(),
          Padding(
            padding: EdgeInsets.only(left: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mehdikeshavarz',
                  style: TextStyle(
                    fontFamily: 'GB',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'مهدی کشاورز',
                  style: TextStyle(
                    fontFamily: 'SM',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_menu.png')
        ],
      ),
    );
  }

  DottedBorder _getStoryBoxHeader() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(17),
      padding: EdgeInsets.all(3),
      strokeWidth: 2,
      dashPattern: [10, 5],
      color: pinkColor,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          height: 39,
          width: 39,
          child: Image.asset('images/profile.png'),
        ),
      ),
    );
  }

  Widget _getStoryFollowing() {
    return Container(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: pinkColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: backgroundColorblack),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('images/profile.png'),
              ),
            ),
          ),
        ),
        Text(
          'Mehdi',
          style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'GB'),
        )
      ],
    ));
  }

  Widget _getAddStoryBox() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: backgroundColorblack),
                child: Image.asset('images/icon_plus.png'),
              ),
            ),
          ),
          Text(
            'YourStory',
            style:
                TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'GM'),
          )
        ],
      ),
    );
  }
}
