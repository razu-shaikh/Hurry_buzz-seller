class NotificationModel {
  NotificationModel({
      List<Notifications>? notifications,}){
    _notifications = notifications;
}

  NotificationModel.fromJson(dynamic json) {
    if (json['notifications'] != null) {
      _notifications = [];
      json['notifications'].forEach((v) {
        _notifications?.add(Notifications.fromJson(v));
      });
    }
  }
  List<Notifications>? _notifications;

  List<Notifications>? get notifications => _notifications;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_notifications != null) {
      map['notifications'] = _notifications?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Notifications {
  Notifications({
      int? id, 
      String? userId, 
      String? title, 
      String? details, 
      String? url, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      String? date, 
      String? time,}){
    _id = id;
    _userId = userId;
    _title = title;
    _details = details;
    _url = url;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _date = date;
    _time = time;
}

  Notifications.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _title = json['title'];
    _details = json['details'];
    _url = json['url'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _date = json['date'];
    _time = json['time'];
  }
  int? _id;
  String? _userId;
  String? _title;
  String? _details;
  String? _url;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _date;
  String? _time;

  int? get id => _id;
  String? get userId => _userId;
  String? get title => _title;
  String? get details => _details;
  String? get url => _url;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get date => _date;
  String? get time => _time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['title'] = _title;
    map['details'] = _details;
    map['url'] = _url;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['date'] = _date;
    map['time'] = _time;
    return map;
  }

}