import 'package:flutter/material.dart';
import 'package:flutter_0205/page/common_page.dart';

/**
 * 这是一个带有floatActionBar的底部栏
 * */

class TabNavigationWithFloatActionBar extends StatefulWidget {
  @override
  _TabNavigationWithFloatActionBarState createState() =>
      _TabNavigationWithFloatActionBarState();
}

class _TabNavigationWithFloatActionBarState
    extends State<TabNavigationWithFloatActionBar> {
  int _counter = 0;
  String pageType = "home"; //home,mine
  int _currentIndex = 0;

  List<CommonView> bodyList = List();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      bodyList[_currentIndex].changeCounter(_counter);
    });
  }

  @override
  void initState() {
    bodyList..add(new CommonView("home"))..add(new CommonView("mine"));
    super.initState();
  }

  final int redColor = 0xeeee0000;
  final int greyColor = 0xeeeeeeee;

  Color changeColor(int position) =>
      Color(_currentIndex == position ? redColor : greyColor);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(pageType),
      ),
      body: bodyList[_currentIndex].changeCounter(_counter),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: changeColor(0)),
            title: Text("Home", style: TextStyle(color: changeColor(0))),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplay, color: changeColor(1)),
              title: Text("Mine", style: TextStyle(color: changeColor(1))))
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            if (index == 0) {
              pageType = "home";
            } else if (index == 1) {
              pageType = "mine";
            }
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
