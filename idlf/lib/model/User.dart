import 'dart:convert';

Users reqResFromJson(String str) => Users.fromJson(json.decode(str));
String reqResToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.userList,
  });

  int page;
  int perPage;
  int total;
  int totalPages;
  List<User> userList;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    page: json["page"],
    perPage: json["per_page"],
    total: json["total"],
    totalPages: json["total_pages"],
    userList: List<User>.from(json["data"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "per_page": perPage,
    "total": total,
    "total_pages": totalPages,
    "data": List<dynamic>.from(userList.map((x) => x.toJson())),
  };
}

class User {
  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
  };
}