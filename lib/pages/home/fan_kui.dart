import 'package:flutter/material.dart';

class Fankui extends StatelessWidget {
  const Fankui({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 31, 45, 1),
      appBar: AppBar(
        title: Text('建议反馈'),
      ),
      body: Column(
        children: <Widget>[
          _tips(),
          _email()
        ],
      ),
    );
  }
  Widget _tips() => Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
    child: Text(
      '有疑问或建议请发送邮件以下客服邮箱，感谢支持！',
      style: TextStyle(
        color: Color.fromRGBO(31,91,119, 1)
      ),
    ),
  );
  Widget _email() => Container(
    alignment: Alignment.center,
    child: Text(
      '773416615@qq.com',
      style: TextStyle(
        color: Color.fromRGBO(0,204,204, 1),
        fontSize: 36
      ),
    ),
  );
}