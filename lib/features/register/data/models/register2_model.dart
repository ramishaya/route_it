class Register2Model {
  String? message;
  UserInfo? userInfo;

  Register2Model({this.message, this.userInfo});

  Register2Model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userInfo = json['User Info'] != null
        ? UserInfo.fromJson(json['User Info'])
        : null;
  }
}

class UserInfo {
  int? id;
  String? email;
  int? verify;
  String? name;
  String? image;
  String? birthDate;
  String? itStudent;
  String? university;
  String? bio;
  String? createdAt;
  String? updatedAt;

  UserInfo(
      {this.id,
        this.email,
        this.verify,
        this.name,
        this.image,
        this.birthDate,
        this.itStudent,
        this.university,
        this.bio,
        this.createdAt,
        this.updatedAt});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    verify = json['verify'];
    name = json['name'];
    image = json['image'];
    birthDate = json['birth_date'];
    itStudent = json['it_student'];
    university = json['university'];
    bio = json['bio'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}