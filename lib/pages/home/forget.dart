import 'package:flutter/material.dart';

class Forget extends StatefulWidget {
  Forget({Key key}) : super(key: key);

  _ForgetState createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  @override
  Widget build(BuildContext context) {
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
      child: Text('cyh',
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
        Navigator.of(context).pushReplacementNamed('/home');
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