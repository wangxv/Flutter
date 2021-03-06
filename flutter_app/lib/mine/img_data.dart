class Autogenerated {
  String errno;
  String errmsg;
  String consume;
  String total;
  List<Data> data;

  Autogenerated({this.errno, this.errmsg, this.consume, this.total, this.data});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    errno = json['errno'];
    errmsg = json['errmsg'];
    consume = json['consume'];
    total = json['total'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errno'] = this.errno;
    data['errmsg'] = this.errmsg;
    data['consume'] = this.consume;
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String id;
  String name;
  String totalcnt;
  String createTime;
  String displaytype;
  String tempdata;

  Data(
      {this.id,
      this.name,
      this.totalcnt,
      this.createTime,
      this.displaytype,
      this.tempdata});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    totalcnt = json['totalcnt'];
    createTime = json['create_time'];
    displaytype = json['displaytype'];
    tempdata = json['tempdata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['totalcnt'] = this.totalcnt;
    data['create_time'] = this.createTime;
    data['displaytype'] = this.displaytype;
    data['tempdata'] = this.tempdata;
    return data;
  }
}