// ignore_for_file: prefer_collection_literals

class RegisterModel {
  String? message;
  UserWithToken? userWithToken;

  RegisterModel({this.message, this.userWithToken});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userWithToken = json['userWithToken'] != null
        ? UserWithToken.fromJson(json['userWithToken'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (userWithToken != null) {
      data['userWithToken'] = userWithToken!.toJson();
    }
    return data;
  }
}

class UserWithToken {
  String? token;
  String? name;

  UserWithToken({this.token, this.name});

  UserWithToken.fromJson(Map<String, dynamic> json) {
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