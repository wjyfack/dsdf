class User {
  String resultCode;
  String resultDesc;
  UserInfo returnData;

  User({this.resultCode, this.resultDesc, this.returnData});

  User.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    resultDesc = json['resultDesc'];
    returnData = json['returnData'] != null
        ? new UserInfo.fromJson(json['returnData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultCode'] = this.resultCode;
    data['resultDesc'] = this.resultDesc;
    if (this.returnData != null) {
      data['returnData'] = this.returnData.toJson();
    }
    return data;
  }
}

class UserInfo {
  String id;
  String userName;
  String loginName;
  String loginPwd;
  String updateFlag;

  UserInfo(
      {this.id, this.userName, this.loginName, this.loginPwd, this.updateFlag});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    loginName = json['loginName'];
    loginPwd = json['loginPwd'];
    updateFlag = json['updateFlag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['loginName'] = this.loginName;
    data['loginPwd'] = this.loginPwd;
    data['updateFlag'] = this.updateFlag;
    return data;
  }
}