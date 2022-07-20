import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../screen/community_screen.dart';
import '../screen/friend_screen.dart';
import '../screen/home_screen.dart';
import '../screen/myfriend_screen.dart';


class BottomNaviScreen extends StatefulWidget {
  const BottomNaviScreen({Key? key}) : super(key: key);

  @override
  _BottomNaviScreenState createState() => _BottomNaviScreenState();
}

class _BottomNaviScreenState extends State<BottomNaviScreen> {
  ShapeBorder bottomBarShape = const Border(top: BorderSide(color: Color(0xFF8B8B8B), width: 0.5),
  bottom: BorderSide(color: Colors.transparent),);


  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(0);

  int _selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.indicator;

  bool showSelectedLabels = true;
  bool showUnselectedLabels = true;

  Color selectedColor = Color(0xFF707070);
  Color snakeViewColor = Color(0xFFFFFFFF);
  Gradient selectedGradient =
  const LinearGradient(colors: [Colors.red, Colors.amber]);

  Color unselectedColor = Color(0xFF707070);
  Gradient unselectedGradient =
  const LinearGradient(colors: [Colors.red, Colors.blue]);

  late Color containerColor;
  List<Color> containerColors = [
    const Color(0xFF707070),
  ];

  screen() {
    if (_selectedItemPosition == 0) return const HomeScreen();
    if (_selectedItemPosition == 1) return const CommunityScreen();
    if (_selectedItemPosition == 2) return const FriendScreen();
    if (_selectedItemPosition == 1) return const MyFriendScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: screen(),
      bottomNavigationBar: SnakeNavigationBar.color(
        height: 80,
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: padding,
        snakeViewColor: snakeViewColor,
        selectedItemColor:
        snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: Color(0xFF707070),
        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,
        backgroundColor: Color(0xFFFFFFFF),
        currentIndex: _selectedItemPosition,
        onTap: (index) {
          setState(() => _selectedItemPosition = index);
        },
        elevation: 1.0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,color: Color(0xFF707070),), label: 'Home', ),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/communityIcon.png'), color: Color(0xFF707070),), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.tag_faces,color: Color(0xFF707070)), label: 'Friend'),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/myfriendIcon.png'), color: Color(0xFF707070)), label: 'My Friends'),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 12,color:Color(0xFF707070) ),
        unselectedLabelStyle: const TextStyle(fontSize: 12, color:Color(0xFF707070)),
      ),
    );
  }
}
