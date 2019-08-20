import 'package:flutter/material.dart';
import '../../services/request.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import '../../config/index.dart';
import '../../model/log.dart';
import 'dart:convert';
class Detail extends StatefulWidget {
  String _id;
  Detail(this._id, {Key key}) : super(key: key);

  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int _pageNum = 0;
  List<LogItem> _list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 31, 45, 1),
      appBar: AppBar(title: Text('漏电开关跳闸详情'),),
      body: Container(
        padding: EdgeInsets.all(15),
        child: EasyRefresh(
          firstRefresh: true,
          enableControlFinishLoad: true,
          firstRefreshWidget: Text('加载中...',style: TextStyle(color: Colors.white, fontSize: 18),),
          footer: MaterialFooter(),
          child: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return _cont(_list[index]);
            },
          ),
          onLoad: _getDetail,
          onRefresh: _getDetail,
        )
      ),
    );
  }
  Future<String> _getDetail() async{
    ++_pageNum ;
    var data = {
      'deviceId': widget._id,
      'pageNum': _pageNum.toString(),
      'pageSize': '10'
    };
    await request(urls['detail'],formData: data).then((res){
      print(res);
      var data = json.decode(res.toString());
      LogReturn logReturn =  LogReturn.fromJson(data);
      if(logReturn.resultCode == '0000000') {
        _list.addAll(logReturn.returnData.list);
      }
    });
    return 'end';
  }
  Widget _cont(LogItem item) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(30,40,53, 1),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Color.fromRGBO(15,119,126, 1))
      ),
      child: Column(
        children: <Widget>[
          _yichange(item),
          _status(item),
          _footer('发生时间：${item.createTime}'),
          _footer('复位时间：${item.updateTime}'),
        ],
      ),
    );
  }
  Widget _yichange(item) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(15,119,126, 1)))
      ),
      child: Text(getStatusName(item.status), style: TextStyle(color: Colors.white, fontSize: 16),),
    );
  }
  Widget _footer(String name) {
    return Container(
      alignment: Alignment.centerLeft,
      padding:EdgeInsets.all(5),
      child: Text(name, style: TextStyle(fontSize:18,color: Color.fromRGBO(0,255,204,1))),
    );
  }
  Widget _status(LogItem item) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _statusItem('温度','${item.temperature}℃'),
          _statusItem('漏电流','${item.leakElectricity}mA'),
          _statusItem('电流','${item.electricity}A'),
        ],
      ),
    );
  }
  Widget _statusItem(name, value) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('$name', style: TextStyle(color: Colors.white, fontSize: 28),),
          Text('$value', style: TextStyle(color: Color.fromRGBO(0,255,51,1), fontSize: 20),)
        ],
      ),
    );
  }
  String getStatusName(String status) {
    String name = '';
    List list = [
      {
        'value': '0',
        'label': '分闸'
      },
      {
        'value': '1',
        'label': '合闸'
      }
    ];
    list.forEach((i) {
      if (i['value'] == status) {
        name = i['label'];
      }
    });
    return name;
  }
}