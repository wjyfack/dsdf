import 'package:flutter/material.dart';
import '../model/user.dart';
class UserProvide with ChangeNotifier {
   static UserInfo _userInfo = null;
   UserInfo get userInfo => _userInfo; 
  setUserInfo(UserInfo data) {
    _userInfo = data;
    notifyListeners();
  }
}