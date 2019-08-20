import 'package:flutter/material.dart';
import 'dart:async';

class StartUp extends StatefulWidget {
  StartUp({Key key}) : super(key: key);

  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  Timer _timer;
  int count = 3;
  @override
  void initState() { 
    super.initState();
    _setTimeout();
  }
  @override
  Widget build(BuildContext context) {
    
    return Container(
       child: Image.asset('images/start_up.png', fit: BoxFit.fitWidth),
    );
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  _setTimeout() async{
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      // print(123123);
      if(count == 0) {
        _toNav();
      }
      count --;
    });
  }
  _toNav() {
    Navigator.of(context).pushReplacementNamed('/login');
  }
}

