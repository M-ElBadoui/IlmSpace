import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilmspace/friends/FriendsPage.dart';
import 'package:ilmspace/home/HomePage.dart';
import 'package:ilmspace/leaderboard/LeaderBoardPage.dart';
import 'package:ilmspace/main/options/OptionsDrawer.dart';
import 'package:ilmspace/story/StoryPage.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MainScreen extends StatefulWidget {
  final int initialPage;

  const MainScreen({Key key, this.initialPage = 0}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static final List<GlobalKey> _pageKeys = [
    // navigator keys for 5 pages
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey()
  ];
  static final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  PageController _pageController;
  int _page;
  int _bottomNavBarIndex = 0;

  @override
  void initState() {
    super.initState();
    _page = widget.initialPage;
    _pageController = PageController(initialPage: _page);
  }



  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var topBarHeight = screenHeight / 15;
    var spaceHeight = screenHeight / 6.5;
    var buttonBarHeight = screenHeight / 15;
    var appBarHeight = spaceHeight / 2 + buttonBarHeight + topBarHeight + 25;

    HomePage home = HomePage(key: _pageKeys[0], drawerKey: _drawerKey, appBarHeight: appBarHeight,);
    StoryPage story = StoryPage(key: _pageKeys[1]);
    LeaderBoardPage leaderBoard = LeaderBoardPage(key: _pageKeys[2]);
    FriendsPage friends = FriendsPage(key: _pageKeys[3], appBarHeight: appBarHeight,);



    return Scaffold(
      drawer: OptionsDrawer(),
      key: _drawerKey,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          home,
          story,
          leaderBoard,
          friends,

        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Color.fromRGBO(155, 145, 135, 1), width: 0.3),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
//        unselectedItemColor: Colors.grey,
//        selectedItemColor: Theme.of(context).primaryColor,
          showUnselectedLabels: true,
          currentIndex: _bottomNavBarIndex,
          unselectedIconTheme: IconThemeData(
          ),
          onTap: (int index) {
//          PageStorage.of(context)?.readState(context);
            _onBottomNavItemPressed(index);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesome.home,
              ),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Ionicons.ios_book,
//                SimpleLineIcons.book_open,
              ),
              title: Text("Story"),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesome.trophy,
                ),
                title: Text("Leaderboard")),
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesome.group,
                ),
                title: Text("Friends")),
          ],
        ),
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    _onPageChanged(_page);
  }

  void _onPageChanged(int page) {
    setState(() => _page = page);
  }

  void _onBottomNavItemPressed(int index) {
    setState(() {
      _page = index;
      _bottomNavBarIndex = index;
    });
    setState(() => _page = index);

    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }
}
