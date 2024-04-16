// ignore_for_file: prefer_collection_literals

class LoginModel {
  String? message;
  Success? success;

  LoginModel({this.message, this.success});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success =
        json['success'] != null ? Success.fromJson(json['success']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (success != null) {
      data['success'] = success!.toJson();
    }
    return data;
  }
}

class Success {
  String? token;
  String? name;

  Success({this.token, this.name});

  Success.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = token;
    data['name'] = name;
    return data;
  }
}
