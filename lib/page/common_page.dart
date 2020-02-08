import 'package:flutter/material.dart';

/**
 * 定义一个可以一个公用的pageView
 **/

class CommonView extends StatefulWidget {
  String _pageType;
  int _counter;

  CommonView(String pageType) {
    this._pageType = pageType;
  }

  CommonView changeCounter(int counter){
    this._counter = counter;
    return this;
  }
  @override
  _CommonViewState createState() => new _CommonViewState();
}

class _CommonViewState extends State<CommonView> {

 Color _changeColor(){
   if(widget._pageType == "home"){
     return Color(0x999999ff);
   }else{
     return Color(0x9999ff99);

   }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _changeColor(),
      body: Center(
        child: Text(widget._pageType + "==>${widget._counter}")
      ),
    );
  }
}
