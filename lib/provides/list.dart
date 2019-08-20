import 'package:flutter/material.dart';
import '../model/list_data.dart';
import './../config/index.dart';
import 'dart:convert';
import '../services/request.dart';
class DengList with ChangeNotifier {
  List<ItemData> _list = [];
  int pageNum = 1;
  String street = '';
  String area = '';
  List<ItemData> get list => _list;

  setList(List<ItemData> list) {
    _list.addAll(list);
    notifyListeners();
  }

  getList() async {
    pageNum = 1;
    _list = [];
    var data = {
      'area': area,
      'street': street,
      'pageNum': pageNum.toString(),
      'pageSize': '10'
    };
    await request(urls['list'], formData: data).then((res){
      // print(res);
      var response = json.decode(res);
      ListData listData = ListData.fromJson(response);
      if (listData.resultCode == '0000000') {
        if(listData.returnData.list.length != 0) {
          // print(listData.returnData.list.toString());
          _list.addAll(listData.returnData.list);
        }
      }
      notifyListeners();
    });
  }
}