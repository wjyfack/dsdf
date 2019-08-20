import 'package:flutter/material.dart';
import './forget.dart';
import './fan_kui.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:provide/provide.dart';
import '../../provides/user_info.dart';
import '../../model/user.dart';
class My extends StatefulWidget {
  My({Key key}) : super(key: key);

  _MyState createState() => _MyState();
}

class _MyState extends State<My> {
  Timer _timer;
  @override
  Widget build(BuildContext context) {
    return Provide<UserProvide>(
      builder: (context, child, user) {
        return Container(
          child: Column(
            children: <Widget>[
              _title(user.userInfo),
              _list(),
              Container(height: 50,),
              _button()
            ],
          ),
        );
      },
    );
  }
  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }
  Widget _title(UserInfo user) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 50, 30, 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _phoneNum(user.loginName),
          _personInfo(user.userName)
        ],
      ),
    );
  }
  Widget _phoneNum(String num) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      alignment: Alignment.centerLeft,
      child: Text(
        '$num',
        style: TextStyle(
          fontSize: 28,
          color: Color.fromRGBO(0, 204, 204, 1)
        ),
      ),
    );
  }
  Widget _personInfo(String info) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _personInfoItem(info),
          Text('今天登录1次',style: TextStyle(color: Color.fromRGBO(0, 204, 204, 1)),)
        ],
      ),
    );
  }
  Widget _personInfoItem(String info) {
    return Container(
      padding: EdgeInsets.fromLTRB(5,0,5,0),
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Color.fromRGBO(102, 204, 153, 1),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Text(
        '$info',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget _list() {
    return Container(
      child: Column(
        children: <Widget>[
          _listItem('帐号管理', _toPageForget),
          Divider(height: 1, color: Color.fromRGBO(42, 49, 59, 1)),
          _listItem('反馈建议', _toPageFankui),
          Divider(height: 1, color: Color.fromRGBO(42, 49, 59, 1)),
          _listItem('版本升级', () {}),
        ],
      ),
    );
  }
  void _toPageForget() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Forget())
    );
  }
  void _toPageFankui() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Fankui())
    );
  }
  Widget _listItem (String name, Function fn) {
    return Container(
      color: Color.fromRGBO(40, 44, 55, 1),
      child: ListTile(
        onTap: fn,
        title: Text(name, style: TextStyle(color: Color.fromRGBO(0, 204, 204, 1)),),
        trailing: Icon(Icons.arrow_right, color: Color.fromRGBO(0, 204, 204, 1)),
      ),
    );
  }
  Widget _button() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            print('button_tap');
            Fluttertoast.showToast(
            msg: '正在退出...',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
          );
            _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
              UserProvide().setUserInfo(null);
              Navigator.of(context).pushReplacementNamed('/login');
            });
          },
          child: Container(
            alignment: Alignment.center,
            width: 400,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(40, 44, 55, 1),
              border: Border.all(color: Color.fromRGBO(42, 49, 59, 1))
            ),
            child: Text('退出登录', style: TextStyle(color: Color.fromRGBO(0, 204, 204, 1)),),
          )
        )
      ],
    );
  }
}