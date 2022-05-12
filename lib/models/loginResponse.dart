
class LoginResponse {
  User? user;
  String? token;


  LoginResponse({  this.user,  this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      LoginResponse(user: User.fromJson(json['user']), token: json['token']);

  Map<String ,dynamic> toJson() =>{
    'user' : user?.toJson(),
    'token' : token
  };
}

class User {
  String name;
  String email;
  String phone;
  String profile_pic;

  User({required this.email,
    required this.name,
    required this.phone,
    required this.profile_pic});

  factory User.fromJson(Map<String, dynamic> json)=>
      User(email: json['email'],
          name: json['name'],
          phone: json['phone'],
          profile_pic: json['profile_pic']);

  Map<String ,dynamic> toJson() => {
    'name' : name,
    'email' : email,
    'phone' : phone,
    'profile_pic' : profile_pic
  };
}
