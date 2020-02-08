import 'package:flutter/material.dart';
import 'package:flutter_0205/page/boost.dart';
import 'package:flutter_0205/page/home.dart';
import 'package:flutter_0205/page/my.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => new _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _currentIndex = 0;
  final List<Widget> bodyList = [HomePage(), BoostPage(), MyPage()];
  final List<String> titleList = ["首页", "加速", "我的"];

  final int redColor = 0xeeee0000;
  final int greyColor = 0xee999999;

  Color _changeIconState(int position) =>
      Color(_currentIndex == position ? redColor : greyColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(titleList[_currentIndex]),
      ),
      body: bodyList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _changeIconState(0),
            ),
            title: Text(
              titleList[0],
              style: TextStyle(color: _changeIconState(0)),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: _changeIconState(1),
              ),
              title: Text(
                titleList[1],
                style: TextStyle(color: _changeIconState(1)),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.airplay,
                color: _changeIconState(2),
              ),
              title: Text(
                titleList[2],
                style: TextStyle(color: _changeIconState(2)),
              ))
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
