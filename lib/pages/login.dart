import 'package:flutter/material.dart';
import '../services/request.dart';
import '../config/index.dart';
import '../model/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import '../provides/user_info.dart';
class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerText = TextEditingController();
  TextEditingController _controllerPwd = TextEditingController();
  String _name;
  String _pwd;
  @override
  Widget build(BuildContext context) {
    _controllerText.addListener(() {
      _name = _controllerText.text;
    });
    _controllerPwd.addListener(() {
      _pwd = _controllerPwd.text;
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
  Widget _toLogin(context) {
    return Stack(
      children: <Widget>[
        _center(context),
        Positioned(
          left: 0,
          right: 0,
          bottom: 15,
          child: _beta(),
        )
      ],
    );
  }
  Widget _center(context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            _title(),
            _textNameFild(),
            _textPassFild(),
            _button(context),
          ],
        ),
      )
      
    );
  }
  Widget _title() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
      child: Text('Axlab',
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
        controller: _controllerText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(30, 40, 53,1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          prefixIcon: Icon(Icons.phone_iphone, color: Color.fromRGBO(8,163,166, 1),),
          hintText: '请输入手机号号码',
          hintStyle: TextStyle(color: Color.fromRGBO(22,86,74, 1))
        ),
      )
    );
  }
   Widget _textPassFild() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 50),
      child: TextField(
        controller: _controllerPwd,
        obscureText: true,
        decoration: InputDecoration(
          filled: true,
          fillColor:  Color.fromRGBO(30, 40, 53,1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          prefixIcon: Icon(Icons.email, color: Color.fromRGBO(8,163,166, 1),),
          hintText: '请输入密码',
          hintStyle: TextStyle(color: Color.fromRGBO(22,86,74, 1))
        ),
      )
    );
  }
  Widget _button(context) {
    return InkWell(
      onTap: () {
        // 
        var data = {
          'loginName': _name,
          'loginPwd': _pwd
        };
       request(urls['login'], formData: data).then((res) {
         var responseData = json.decode(res.toString());
         User data = User.fromJson(responseData);
         print(res.toString());
         if (data.resultCode == '0000000') {
          UserProvide().setUserInfo(data.returnData);
          Navigator.of(context).pushReplacementNamed('/home');
         } else {
          Fluttertoast.showToast(
            msg: data.resultDesc,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
          );
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
          '登录',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16
          ),
        ),
      ),
    );
  }
  Widget _beta() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Text(
        'BETA',
        style: TextStyle(
          color: Color.fromRGBO(0, 204, 204, 0.2),
          fontSize: 14
        ),
      ),
    );
  }
}