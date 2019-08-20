class LogReturn {
  String resultCode;
  String resultDesc;
  ReturnData returnData;

  LogReturn({this.resultCode, this.resultDesc, this.returnData});

  LogReturn.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    resultDesc = json['resultDesc'];
    returnData = json['returnData'] != null
        ? new ReturnData.fromJson(json['returnData'])
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

class ReturnData {
  int total;
  int pages;
  List<LogItem> list;

  ReturnData({this.total, this.pages, this.list});

  ReturnData.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pages = json['pages'];
    if (json['list'] != null) {
      list = new List<LogItem>();
      json['list'].forEach((v) {
        list.add(new LogItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['pages'] = this.pages;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LogItem {
  Null id;
  Null deviceNo;
  String deviceId;
  Null ccId;
  String city;
  String area;
  String street;
  String voltage;
  String electricity;
  String leakElectricity;
  String temperature;
  String status;
  Null updateTime;
  String createTime;
  Null faultId;
  Null deviceInfoId;
  Null longitude;
  Null latitude;
  String online;
  String rectifyFlag;
  String signalStrength;
  String breakBrakeCount;

  LogItem(
      {this.id,
      this.deviceNo,
      this.deviceId,
      this.ccId,
      this.city,
      this.area,
      this.street,
      this.voltage,
      this.electricity,
      this.leakElectricity,
      this.temperature,
      this.status,
      this.updateTime,
      this.createTime,
      this.faultId,
      this.deviceInfoId,
      this.longitude,
      this.latitude,
      this.online,
      this.rectifyFlag,
      this.signalStrength,
      this.breakBrakeCount});

  LogItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deviceNo = json['deviceNo'];
    deviceId = json['deviceId'];
    ccId = json['ccId'];
    city = json['city'];
    area = json['area'];
    street = json['street'];
    voltage = json['voltage'];
    electricity = json['electricity'];
    leakElectricity = json['leakElectricity'];
    temperature = json['temperature'];
    status = json['status'];
    updateTime = json['updateTime'];
    createTime = json['createTime'];
    faultId = json['faultId'];
    deviceInfoId = json['deviceInfoId'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    online = json['online'];
    rectifyFlag = json['rectifyFlag'];
    signalStrength = json['signalStrength'];
    breakBrakeCount = json['breakBrakeCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['deviceNo'] = this.deviceNo;
    data['deviceId'] = this.deviceId;
    data['ccId'] = this.ccId;
    data['city'] = this.city;
    data['area'] = this.area;
    data['street'] = this.street;
    data['voltage'] = this.voltage;
    data['electricity'] = this.electricity;
    data['leakElectricity'] = this.leakElectricity;
    data['temperature'] = this.temperature;
    data['status'] = this.status;
    data['updateTime'] = this.updateTime;
    data['createTime'] = this.createTime;
    data['faultId'] = this.faultId;
    data['deviceInfoId'] = this.deviceInfoId;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['online'] = this.online;
    data['rectifyFlag'] = this.rectifyFlag;
    data['signalStrength'] = this.signalStrength;
    data['breakBrakeCount'] = this.breakBrakeCount;
    return data;
  }
}