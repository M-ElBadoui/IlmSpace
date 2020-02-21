import 'package:flutter/material.dart';
import 'package:ilmspace/friends/FriendsPage.dart';
import 'package:ilmspace/home/HomePage.dart';
import 'package:ilmspace/leaderboard/LeaderBoardPage.dart';
import 'package:ilmspace/main/NavigationButton.dart';
import 'package:ilmspace/main/Mode.dart';
import 'package:ilmspace/main/settings/OptionsDrawer.dart';
import 'package:ilmspace/quiz/QuizPage.dart';
import 'package:ilmspace/story/StoryPage.dart';

class MainScreen extends StatefulWidget {
  final int initialPage;
  final Mode mode;

  const MainScreen({
    Key key,
    this.initialPage = 2,
    this.mode
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<GlobalKey> _pageKeys = [ // navigator keys for 5 pages
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey()
  ];
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  PageController _pageController;
  int _page;

  @override
  void initState() {
    super.initState();
    _page = widget.initialPage;
    _pageController = PageController(initialPage: _page);
  }

  FloatingActionButtonLocation location =
      _DockedFloatingActionButtonLocation(2);


  List<Image> icons = [
    storyIcon_selected,
    quizIcon_selected,
    homeIcon_selected,
    leaderBoardIcon_selected,
    friendsIcon_selected,
  ];


  Image currentIcon = homeIcon_selected;


  void moveButton(int pos) {
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        currentIcon = icons[pos];
      });
    });
    setState(() {
      location = _DockedFloatingActionButtonLocation(pos);
      setVisible(pos);
      visibilities[visibilities.indexOf(false)] = true;
      visibilities[pos] = false;
      ;
    });
  }

  List<bool> visibilities = [true, true, false, true, true];

  void setVisible(int pos) {
    for (int i = 0; i < 5; i++) {
      visibilities[i] = true;
    }
    visibilities[pos] = !visibilities[pos];
  }

  bool isNewRouteSameAsCurrent = false;




  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var fabHeight = screenWidth / 6;
    var navigationBarHeight = screenHeight/10;



    return Scaffold(
      backgroundColor: widget.mode.backgroundColor,
      drawer: OptionsDrawer(),
      key: _drawerKey,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          StoryPage(key: _pageKeys[0]),
          QuizPage(key: _pageKeys[1]),
          HomePage(key: _pageKeys[2], drawerKey: _drawerKey, mode: widget.mode,),
          LeaderBoardPage(key: _pageKeys[3]),
          FriendsPage(key: _pageKeys[4], mode: widget.mode),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: widget.mode.foregroundColor,
        child: Container(
          height: navigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NavigationButton(
                selected: () {
                  if(_drawerKey.currentState.isDrawerOpen){
                    Navigator.pop(context);
                  }
                  moveButton(0);
                  _onBottomNavItemPressed(0);
                },
                icon: storyIcon,
                visibility: visibilities[0],
              ),
              NavigationButton(
                selected: () {
                  if(_drawerKey.currentState.isDrawerOpen){
                    Navigator.pop(context);
                  }
                  moveButton(1);
                  _onBottomNavItemPressed(1);
                },
                icon: quizIcon,
                visibility: visibilities[1],
              ),
              NavigationButton(
                selected: () {
                  if(_drawerKey.currentState.isDrawerOpen){
                    Navigator.pop(context);
                  }
                  moveButton(2);
                  _onBottomNavItemPressed(2);
                },
                icon: homeIcon,
                visibility: visibilities[2],
              ),
              NavigationButton(
                selected: () {
                  if(_drawerKey.currentState.isDrawerOpen){
                    Navigator.pop(context);
                  }
                  moveButton(3);
                  _onBottomNavItemPressed(3);
                },
                icon: leaderBoardIcon,
                visibility: visibilities[3],
              ),
              NavigationButton(
                selected: () {
                  if(_drawerKey.currentState.isDrawerOpen){
                    Navigator.pop(context);
                  }
                  moveButton(4);
                  _onBottomNavItemPressed(4);
                },
                icon: friendsIcon,
                visibility: visibilities[4],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: location,
      floatingActionButton: Container(
        height: fabHeight,
        child: Column(
          children: <Widget>[
            Container(
              height: fabHeight,
              width: fabHeight,
              child: FloatingActionButton(
                backgroundColor: Color.fromRGBO(189, 189, 164, 1),
                elevation: 0,
                highlightElevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.book),
                ),
                onPressed: null,
              ),
            )
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
    setState(() => _page = index);

    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }
}

class NoScalingAnimation extends FloatingActionButtonAnimator {
  double _x;
  double _y;

  @override
  Offset getOffset({Offset begin, Offset end, double progress}) {
    _x = begin.dx + (end.dx - begin.dx) * progress;
    _y = begin.dy + (end.dy - begin.dy) * progress;
    return Offset(_x, _y);
  }

  @override
  Animation<double> getRotationAnimation({Animation<double> parent}) {
    return Tween<double>(begin: 1.0, end: 1.0).animate(parent);
  }

  @override
  Animation<double> getScaleAnimation({Animation<double> parent}) {
    return Tween<double>(begin: 1.0, end: 1.0).animate(parent);
  }
}

class _DockedFloatingActionButtonLocation extends FloatingActionButtonLocation {
  _DockedFloatingActionButtonLocation(this.pos);

  var pos;

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = scaffoldGeometry.scaffoldSize.width / 5 * (pos + 1) -
        scaffoldGeometry.floatingActionButtonSize.width -
        (scaffoldGeometry.scaffoldSize.width / 5 -
                scaffoldGeometry.floatingActionButtonSize.width) /
            2;

    final double fabY = scaffoldGeometry.contentBottom -
        scaffoldGeometry.bottomSheetSize.height -
        scaffoldGeometry.floatingActionButtonSize.height / 2;
    return Offset(fabX, fabY);
  }
}


Image storyIcon = Image.asset("assets/images/icons/story_icon.png", color: Colors.black,);
Image quizIcon = Image.asset("assets/images/icons/quiz_icon.png",color: Colors.black,);
Image homeIcon = Image.asset("assets/images/icons/home_icon.png",color: Colors.black,);
Image leaderBoardIcon = Image.asset("assets/images/icons/leaderboard_icon.png",color: Colors.black,);
Image friendsIcon = Image.asset("assets/images/icons/friends_icon.png",color: Colors.black,);

Image storyIcon_selected = Image.asset("assets/images/icons/story_icon.png", color: Color.fromRGBO(208, 160, 97, 1),);
Image quizIcon_selected = Image.asset("assets/images/icons/quiz_icon.png",color: Color.fromRGBO(208, 160, 97, 1),);
Image homeIcon_selected = Image.asset("assets/images/icons/home_icon.png",color: Color.fromRGBO(208, 160, 97, 1),);
Image leaderBoardIcon_selected = Image.asset("assets/images/icons/leaderboard_icon.png",color: Color.fromRGBO(208, 160, 97, 1),);
Image friendsIcon_selected = Image.asset("assets/images/icons/friends_icon.png",color: Color.fromRGBO(208, 160, 97, 1),);
