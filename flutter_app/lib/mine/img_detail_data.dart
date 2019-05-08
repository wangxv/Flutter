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
  String pid;
  String cid;
  String dlCnt;
  String cT;
  String imgcut;
  String url;
  String tempdata;
  String favTotal;

  Data(
      {this.pid,
      this.cid,
      this.dlCnt,
      this.cT,
      this.imgcut,
      this.url,
      this.tempdata,
      this.favTotal});

  Data.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    cid = json['cid'];
    dlCnt = json['dl_cnt'];
    cT = json['c_t'];
    imgcut = json['imgcut'];
    url = json['url'];
    tempdata = json['tempdata'];
    favTotal = json['fav_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['cid'] = this.cid;
    data['dl_cnt'] = this.dlCnt;
    data['c_t'] = this.cT;
    data['imgcut'] = this.imgcut;
    data['url'] = this.url;
    data['tempdata'] = this.tempdata;
    data['fav_total'] = this.favTotal;
    return data;
  }
}