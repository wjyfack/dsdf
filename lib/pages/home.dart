import 'package:flutter/material.dart';
import './home/index.dart';
import './home/my.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // data = {
  //   area,
  //   street,
  //   pageNum,
  //   pageSize
  // }
  int _index = 0;
  List<Widget> list = [
    Index(),
    My()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 31, 45, 1),
      body: list[_index],
      // body: IndexedStack(
      //   index: _index,
      //   children: list,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Color.fromRGBO(121, 121, 121, 1),
        // selectedItemColor: Color.fromRGBO(6, 169 , 172, 1),
        // unselectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(45,41,63, 1),
            icon: Icon(Icons.devices),
            title: Text('设备')
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(45,41,63, 1),
            icon: Icon(Icons.my_location),
            title: Text('我的')
          )
        ],
      ),
    );
  }
}