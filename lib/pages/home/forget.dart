import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ludeng/config/index.dart';
import 'package:flutter_ludeng/services/request.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';
import '../../provides/user_info.dart';
class Forget extends StatefulWidget {
  Forget({Key key}) : super(key: key);

  _ForgetState createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  TextEditingController _controllerPwd = TextEditingController();
  TextEditingController _controllerNewPwd = TextEditingController();
  String _pwd = '';
  String _newPwd = '';
  Timer _timer;
  @override
  Widget build(BuildContext context) {
    _controllerPwd.addListener(() {
      _pwd = _controllerPwd.text;
    });
    _controllerNewPwd.addListener(() {
      _newPwd = _controllerNewPwd.text;
    });
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(32, 31, 45, 1)
          // image: DecorationImage(
          //   image: AssetImage('images/bg.png'),
          //   fit: BoxFit.cover
          // )
        ),
        child: _toLogin(context),
      )
    );
  }
  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }
  Widget _toLogin(context) {
    return Stack(
      children: <Widget>[
        _center(context),
      ],
    );
  }
  Widget _center(context) {
    return Provide<UserProvide>(
      builder: (context, child, user) {
        return Center(
          child: Container(
            child: Column(
              children: <Widget>[
                _title(user.userInfo.loginName),
                _textNameFild(),
                _textPassFild(),
                _button(context),
              ],
            ),
          )
        );
      },
    );
  }
  Widget _title(String name) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
      child: Text('$name',
        style: TextStyle(
          color: Color.fromRGBO(6, 169, 172, 1),
          fontSize: 52
        ),
      ),
    );
  }
  Widget _textNameFild() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: TextField(
        controller: _controllerPwd,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(30, 40, 53,1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          prefixIcon: Icon(Icons.party_mode, color: Color.fromRGBO(8,163,166, 1),),
          hintText: '请输入旧密码',
          hintStyle: TextStyle(color: Color.fromRGBO(22,86,74, 1))
        ),
      )
    );
  }
   Widget _textPassFild() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 50),
      child: TextField(
        controller: _controllerNewPwd,
        decoration: InputDecoration(
          filled: true,
          fillColor:  Color.fromRGBO(30, 40, 53,1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          prefixIcon: Icon(Icons.network_locked, color: Color.fromRGBO(8,163,166, 1),),
          hintText: '请输入新密码',
          hintStyle: TextStyle(color: Color.fromRGBO(22,86,74, 1))
        ),
      )
    );
  }
  Widget _button(context) {
    return InkWell(
      onTap: () {
        String id = Provide.value<UserProvide>(context).userInfo.id;
        var data = {
          'id': id,
          'oldPwd': _pwd,
          'newPwd': _newPwd
        };
        request(urls['update'], formData: data).then((res) {
          var responseData = json.decode(res.toString());
          Fluttertoast.showToast(
            msg: responseData['resultDesc'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
          );
          if (responseData['resultCode'] == '0000000') {
            _timer = Timer.periodic(Duration(seconds: 2), (Timer timer){
              Navigator.of(context).pushReplacementNamed('/home');
            });
          }
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromRGBO(6,169,172, 1),
          borderRadius: BorderRadius.circular(5)
        ),
        child: Text(
          '修改密码',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16
          ),
        ),
      ),
    );
  }
}