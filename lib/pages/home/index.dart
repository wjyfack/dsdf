import 'package:flutter/material.dart';
import '../home/item.dart';
import '../home/devices.dart';
import 'package:provide/provide.dart';
import './../../provides/list.dart';
import './../../services/request.dart';
import './../../config/index.dart';
import '../../model/list_data.dart';
import 'dart:convert';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:web_socket_channel/io.dart';
class Index extends StatefulWidget {
  Index({Key key}) : super(key: key);

  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int pageNum = 0;
  IOWebSocketChannel _channel;
   List<ItemData> list = [];
  @override
  Widget build(BuildContext context) {
    // return Stack(children: <Widget>[
    //   Container(
    //     child: Text(''),
    //     height: 80,
    //   ),
    //   FutureBuilder(
    //     future: getList(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         List<ItemData> list =  Provide.value<DengList>(context).list;
    //         return ListView.builder(
    //           itemCount: list.length,
    //           itemBuilder: (context, index) => Item(list[index]),
    //         );
    //       } else {
    //         return Text('暂无数据');
    //       }
    //     }),
    //     Positioned(top: 0,left: 0,right: 0,child: Device(),),
    //   ]
    // );
    _initSocket();
    // Provide.value<DengList>(context).setList([]);
    return Provide<DengList>(
      builder: (context, child, data){
        return Stack(children: <Widget>[
        Container(
          padding: EdgeInsets.all(40),
          alignment: Alignment.center,
          child: Text(''),
          height: 1,
        ),
         EasyRefresh(
          firstRefresh: true,
          enableControlFinishLoad: true,
          enableControlFinishRefresh: true,
          // firstRefreshWidget: Center(
          //   child: Text('加载中...',style: TextStyle(color: Colors.white, fontSize: 18),),
          // ),
          footer: MaterialFooter(),
          child: ListView.builder(
            padding: EdgeInsets.only(top: 20),
            itemCount: data.list.length,
            itemBuilder: (context, index) => Item(data.list[index]),
          ),
          onLoad: getList,
          onRefresh: getList,
        ), 
        Positioned(height: 80,top: 0,left: 0,right: 0,child: Device(),),
      ]
    );
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _channel.sink.close();
    super.dispose();
  }
  void _initSocket() async {
    _channel = IOWebSocketChannel.connect(wsUrl+ DateTime.now().toString());
    _channel.stream.listen((message) {
      // print(message);
      var mes = json.decode(message);
      // print(mes['deviceId']);
      ItemData item = ItemData.fromJson(mes);
      
      List<ItemData> list = Provide.value<DengList>(context).list;
      // print(list);
      List<ItemData> nList = list.map((i) {
        if (i.deviceId == item.deviceId) {
          print(item);
          return item;
        } else {
          return i;
        }
      }).toList();
      //加上会卡死
      // Provide.value<DengList>(context).setList(nList);
      // Provide.value<DengList>(context).setList(list.map((i) {
      //   if (i.deviceId == item.deviceId) {
      //     return item;
      //   } else {
      //     return i;
      //   }
      // }).toList());
    });
  }
  Future<String> getList() async {
    pageNum += 1;
    var data ={
      'area': '',
      'street': '',
      'pageNum':  pageNum.toString(),
      'pageSize': '10'
    };
    var res = await request(urls['list'], formData: data);
    var response = json.decode(res);
    ListData listData = ListData.fromJson(response);
    if (listData.resultCode == '0000000') {
      // list.addAll(listData.returnData.list);
      Provide.value<DengList>(context).setList(listData.returnData.list);
      // print(Provide.value<DengList>(context).list.length);
    }
    return 'end';
  }
}