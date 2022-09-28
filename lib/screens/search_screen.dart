import 'package:flutter/material.dart';
import 'package:flutter_application_instagram/constants/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorblack,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _getHaeder()),
          SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
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
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: [
                QuiltedGridTile(2, 1),
                QuiltedGridTile(2, 2),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
              ],
            ),
          )
        ],
      )),
    );
  }

  Column _getHaeder() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 12, left: 18, right: 18),
          height: 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            color: Color(0xff272B40),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Image.asset('images/icon_search.png'),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintStyle:
                            TextStyle(fontFamily: 'GB', color: Colors.white)),
                  ),
                ),
                Image.asset('images/icon_scan.png')
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 6),
                height: 23,
                width: 63,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff272B40)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      _getHashtagName()[index],
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'GB', fontSize: 14),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  List<String> _getHashtagName() {
    return [
      'All',
      'Account',
      'Hashtag',
      'caption',
      'story',
      'All',
      'Account',
      'Hashtag',
      'caption',
      'story'
    ];
  }
}
