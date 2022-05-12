import 'dart:convert' as convert;
import 'package:api_demo/models/loginResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/getResponse.dart';

class ApiService{
  
  Future<LoginResponse> apiPost(Map<String,dynamic> para)async{
     var url = Uri.parse("https://yssattendance.infikey.buzz/public/api/login");
     var response = await http.post(url,body: para);
     if(response.statusCode == 200){
     final data=convert.jsonDecode(response.body);
     LoginResponse responseModel =  LoginResponse.fromJson(data);
     print(responseModel.toJson());
     return responseModel;
     }
     else{
       throw 'fail to load data';
     }
  }

  Future apiGet(token) async{
    var url = Uri.parse("https://yssattendance.infikey.buzz/public/api/master_admin/dashboard");
    var response = await http.get(url ,headers: {
      "Authorization" : 'Bearer '+token
    });
    if(response.statusCode == 200){
      final data = convert.jsonDecode(response.body);
      DashBoardModal dashBoardModal = DashBoardModal.fromjson(data);
      return dashBoardModal;
    }
    else{
      throw response.body;
    }
  }
}

