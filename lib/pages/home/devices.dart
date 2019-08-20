import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provides/list.dart';
class Device extends StatefulWidget {
  Device({Key key}) : super(key: key);

  _DeviceState createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  var _valueQu;
  var _valueStreet;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Color.fromRGBO(46,48,63, 1),
      ),
      child: _select(),
    );
  }
  Widget _select() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
      decoration: BoxDecoration(
        color: Color.fromRGBO(46,48,63, 1)
      ),
      child: Row(
        children: <Widget>[
          _selectQu(),
          _selectStreet()
        ],
      ),
    );
  }
  Widget _selectQu() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('区：'),
          DropdownButton(
            hint: Text('请选择区'),
            value: _valueQu,
            items: getAllQu(),
            onChanged: (T){//下拉菜单item点击之后的回调
              setState(() {
                _valueQu=T;
                Provide.value<DengList>(context).area = T;
                Provide.value<DengList>(context).getList();
              });
            },
          )
        ],
      ),
    );
  }

  List<DropdownMenuItem> getAllQu() {
    List<DropdownMenuItem> items = List();
    DropdownMenuItem dropdownMenuItem1 = DropdownMenuItem(
      child: Text('全区'),
      value: '',
    );
    DropdownMenuItem dropdownMenuItem2 = DropdownMenuItem(
      child: Text('天河区'),
      value: '天河区',
    );
    items.add(dropdownMenuItem1);
    items.add(dropdownMenuItem2);
    return items;
  }
  Widget _selectStreet() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('镇街：'),
          DropdownButton(
            hint: Text('请选择镇街'),
            value: _valueStreet,
            items: getAllStreet(),
            onChanged: (T){//下拉菜单item点击之后的回调
              setState(() {
                _valueStreet=T;
              });
            },
          )
        ],
      ),
    );
  }
  List<DropdownMenuItem> getAllStreet() {
    List<DropdownMenuItem> items = List();
    DropdownMenuItem dropdownMenuItem1 = DropdownMenuItem(
      child: Text('全区'),
      value: '',
    );
    DropdownMenuItem dropdownMenuItem2 = DropdownMenuItem(
      child: Text('天河区'),
      value: '天河区',
    );
    items.add(dropdownMenuItem1);
    items.add(dropdownMenuItem2);
    return items;
  }
}
