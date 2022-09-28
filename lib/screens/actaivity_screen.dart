import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_instagram/constants/constants.dart';
import 'package:flutter_application_instagram/model/enum/activity_type_enum.dart';

class ActivityScreen extends StatefulWidget {
  ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorblack,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            color: backgroundColorblack,
            height: 70,
            child: TabBar(
              labelStyle: TextStyle(fontFamily: 'GB', fontSize: 16),
              indicatorColor: pinkColor,
              indicatorWeight: 3.0,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
              controller: _tabController,
              tabs: [
                Tab(
                  text: 'Following',
                ),
                Tab(
                  text: 'You',
                )
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, top: 32, bottom: 18),
                        child: Text(
                          'New',
                          style: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return _getRow(ActivityStatus.Followback);
                      }, childCount: 2),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, top: 32, bottom: 18),
                        child: Text(
                          'Toady',
                          style: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return _getRow(ActivityStatus.Like);
                      }, childCount: 3),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, top: 32, bottom: 18),
                        child: Text(
                          'This Week',
                          style: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return _getRow(ActivityStatus.Following);
                      }, childCount: 3),
                    )
                  ],
                ),
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, top: 32, bottom: 18),
                        child: Text(
                          'New',
                          style: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return _getRow(ActivityStatus.Like);
                      }, childCount: 3),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, top: 32, bottom: 18),
                        child: Text(
                          'Toady',
                          style: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return _getRow(ActivityStatus.Following);
                      }, childCount: 2),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, top: 32, bottom: 18),
                        child: Text(
                          'This Week',
                          style: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return _getRow(ActivityStatus.Followback);
                      }, childCount: 3),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget _getRow(ActivityStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: pinkColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 7),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('images/item4.png'),
              ),
            ),
          ),
          SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'mehdikeshavarz',
                    style: TextStyle(
                        fontFamily: 'GB', fontSize: 14, color: Colors.white),
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Stared Following',
                    style: TextStyle(
                        fontFamily: 'GB',
                        fontSize: 12,
                        color: Color(0xffC5C5C5)),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'You',
                    style: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 13,
                        color: Color(0xffC5C5C5)),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '3 min',
                    style: TextStyle(
                        fontFamily: 'GB',
                        fontSize: 14,
                        color: Color(0xffC5C5C5)),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          _getActionActivityRow(status)
        ],
      ),
    );
  }

  Widget _getActionActivityRow(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.Like:
        return SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/item6.png'),
            ),
          ),
        );
      case ActivityStatus.Following:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
                fontFamily: 'GB', fontSize: 12, color: Color(0xffC5C5C5)),
          ),
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Color(0xffC5C5C5), width: 2)),
        );
      case ActivityStatus.Followback:
        return ElevatedButton(
          onPressed: () {},
          child: Text('Following'),
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
                fontFamily: 'GB', fontSize: 12, fontWeight: FontWeight.w700),
            primary: pinkColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
          ),
        );
      default:
        return ElevatedButton(
          onPressed: () {},
          child: Text('Following'),
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
                fontFamily: 'GB', fontSize: 12, fontWeight: FontWeight.w700),
            primary: pinkColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
          ),
        );
    }
  }
}
