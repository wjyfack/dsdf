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
  IOWebSocketChannel _channel = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSocket();
  }
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
    Provide.value<DengList>(context).setList([]);
    return Stack(children: <Widget>[
        // Container(
        //   padding: EdgeInsets.only(top: 80),
        //   alignment: Alignment.center,
        //   child: Text('11'),
        //   height: 1,
        // ),
        Provide<DengList>(
          builder: (context, child, data){
            return EasyRefresh(
              firstRefresh: true,
              enableControlFinishLoad: false,
              enableControlFinishRefresh: true,
              // firstRefreshWidget: Center(
              //   child: Text('加载中...',style: TextStyle(color: Colors.white, fontSize: 18),),
              // ),
              footer: MaterialFooter(),
              child: ListView.builder(
                padding: EdgeInsets.only(top: 80),
                itemCount: data.list.length,
                itemBuilder: (context, index) => Item(data.list[index]),
              ),
              onLoad: getList,
              onRefresh: getList,
            );
          }
        ), 
        Positioned(top: 0,left: 0,right: 0,child: Device(),),
      ]
    );
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
      print(message);
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
      Provide.value<DengList>(context).setList(listData.returnData.list);
      print(Provide.value<DengList>(context).list.length);
    }
    return 'end';
  }
}