import 'package:flutter/material.dart';

class BoostPage extends StatefulWidget {
  @override
  _BoostPageState createState() => new _BoostPageState();
}

class _BoostPageState extends State<BoostPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xeefaafaa),
      body: Center(
        child: Text("Boost"),
      ),
    );
  }
}
