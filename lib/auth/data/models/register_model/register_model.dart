class RegisterModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  List<String>? phones;
  List<Roles>? roles;

  RegisterModel(
      {this.firstName,
        this.lastName,

        this.email,
        this.password,
        this.phones,
        this.roles});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];

    email = json['email'];
    password = json['password'];
    phones = json['phones'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;

    data['email'] = email;
    data['password'] = password;
    data['phones'] = phones;
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  String? id;
  String? name;

  Roles({this.id, this.name});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}