import 'package:flutter/material.dart';
import '../../model/list_data.dart';
import './detail.dart';
class Item extends StatefulWidget {
  ItemData _item ;
  Item(this._item, {Key key}) : super(key: key);

  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 250,
      margin: EdgeInsets.fromLTRB(15, 15, 15, 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(30,40,53, 1),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Color.fromRGBO(15,119,126, 1))
      ),
      child: Card(
        color: Color.fromRGBO(40, 44, 55, 1),
        elevation: 15.0, // 阴影
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
        child: _body(),
      ),
    );
  }
  Widget _body() {
    return InkWell(
      onTap: _onTap,
      child: Column(
        children: <Widget>[
          _title(),
          _divider(),
          _cont(),
          _divider(),
          _footer(),
        ],
      )
    );
  }
  _onTap() {
    // Navigator.of(context).pushNamed('/detail');
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detail(widget._item.deviceId)));
  }
  Widget _divider() {
    return Divider(color: Colors.white,);
  }
  Widget _title() {
    MaterialAccentColor color =  widget._item.online == '1' ? Colors.blueAccent : Colors.red;
    String name =  widget._item.online == '1' ? '在线' : '不在线';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(padding: EdgeInsets.all(5),child: Text('ID： ${widget._item.deviceId}', style: TextStyle(fontSize: 18,color: Colors.white)),),
        Container(padding: EdgeInsets.fromLTRB(5, 5, 0, 5),color: color, child: Text(name, style: TextStyle(color: Colors.white),),)
      ],
    );
  }
  Widget _cont() {
    return Row(
      children: <Widget>[
        _contItem('温度', '${widget._item.temperature}℃'),
        _contItem('漏电流', '${widget._item.leakElectricity}mA'),
        _contItem('电流', '${widget._item.electricity}A'),
      ],
    );
  }
  Widget _contItem(String name, String value) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text('$name', style: TextStyle(fontSize: 24, color: Colors.white),),
          Text('$value', style: TextStyle(fontSize: 24, color: Colors.green),)
        ],
      )
    );
  }
  Widget _footer() {
    return Row(
      children: <Widget>[
        _footerItem('GSRS信号', '${widget._item.signalStrength}'),
       _chuiz(),
        _daohang(),
       _chuiz(),
         _footerItem('跳闸次数', '${widget._item.breakBrakeCount}'),
      ],
    );
  }
  Widget _footerItem(String name, String value) {
    return Expanded( 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('$name',style: TextStyle(fontSize: 18, color: Colors.white),),
          Text('$value',style: TextStyle(color: Color.fromRGBO(121, 121, 121, 1),))
        ],
      )
    );
  }
  Widget _daohang() {
    return Expanded(
     child: InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Text('导航', style: TextStyle(color: Colors.white, fontSize: 18),),
          Image(
            image: AssetImage('images/dao.png'),
            width: 30,
          )
          // Image.asset('images/dao.png',fit: BoxFit.fitWidth, height: 30, )
        ],
      ),
     )
    );
  }
  Widget _chuiz() {
    return Container(
      height: 20,
      width: 1,
      color: Colors.white,
      child: null,
    );
  }
}