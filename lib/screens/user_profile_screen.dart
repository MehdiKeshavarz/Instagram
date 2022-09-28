import 'package:flutter/material.dart';
import 'package:flutter_application_instagram/constants/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorblack,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, IsScrolled) {
              return [
                SliverAppBar(
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(top: 18, right: 18),
                      child: Icon(Icons.menu),
                    ),
                  ],
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(10),
                    child: Container(
                      height: 17,
                      decoration: BoxDecoration(
                          color: backgroundColorblack,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                    ),
                  ),
                  backgroundColor: backgroundColorblack,
                  expandedHeight: 170,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'images/Header_profile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _getHeaderProfile(),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: TabBarViewDalgate(
                    TabBar(
                        indicatorColor: pinkColor,
                        indicatorWeight: 3,
                        indicatorPadding: EdgeInsets.only(bottom: 5),
                        tabs: [
                          Tab(
                            icon: Image.asset('images/icon_tab_post.png'),
                          ),
                          Tab(
                            icon: Image.asset('images/icon_tab_bookmark.png'),
                          ),
                        ]),
                  ),
                )
              ];
            },
            body: TabBarView(children: [
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20),
                    sliver: SliverGrid(
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
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20),
                    sliver: SliverGrid(
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
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _getHeaderProfile() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              border: Border.all(color: pinkColor, width: 2),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(13)),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('images/profile.png'),
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Container(
            height: 70,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مهدی کشاورز',
                    style: TextStyle(
                        fontFamily: 'SM', fontSize: 14, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Mehdikeshavarz',
                    style: TextStyle(
                        fontFamily: 'GB', fontSize: 14, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          Image.asset('images/icon_edit.png')
        ],
      ),
    );
  }
}

class TabBarViewDalgate extends SliverPersistentHeaderDelegate {
  TabBarViewDalgate(this._tabBar);

  final TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColorblack,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
