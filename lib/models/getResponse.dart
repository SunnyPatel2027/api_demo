class DashBoardModal {
  String message;
  int total_clients;
  int total_employees;
  int total_admins;
  List<Client> recent_clients;
  List<Admin> recent_admins;
  List<Employees> recent_employees;

  DashBoardModal(
      {required this.message,
      required this.recent_clients,
      required this.total_admins,
      required this.total_clients,
      required this.total_employees,
      required this.recent_admins,
      required this.recent_employees});

  factory DashBoardModal.fromjson(Map<String, dynamic> json) => DashBoardModal(
      message: json['message'],
      recent_clients: (json['recent_clients'] as List).map((e) => Client.fromJson(e)).toList(),
      total_admins: json['total_admins'],
      total_clients: json['total_clients'],
      total_employees: json['total_employees'],
      recent_admins: (json['recent_admins'] as List).map((e) => Admin.fromJson(e)).toList(),
    recent_employees: (json['recent_employees'] as List).map((e) => Employees.fromJson(e)).toList()
  );

  Map<String, dynamic> toJson() => {
        'message': message,
        'total_clients': total_clients,
        'total_employees': total_employees,
    'total_admins' :total_admins,
    'recent_clients' : recent_clients.map((e) => e.toJson()).toList(),
    'recent_admins' : recent_admins.map((e) => e.toJson()).toList(),
    'recent_employees' : recent_employees.map((e) => e.toJson()).toList()
      };
}


class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? profile_pic;

  User({this.phone, this.name, this.profile_pic, this.email, this.id});

  User.fromJson(Map<String, dynamic> json) {

        id =  json['id'];
        phone = json['phone'];
        name = json['name'];
        profile_pic = json['profile_pic'];
        email = json['email'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'profile_pic': profile_pic
      };
}

class Client extends User{
   Client.fromJson(Map<String,dynamic> data) : super.fromJson(data);
}

class Admin extends User{
  Admin.fromJson(Map<String ,dynamic> data) : super.fromJson(data);
}

class Employees extends User{
  Employees.fromJson(Map<String,dynamic> data) :super.fromJson(data);
}