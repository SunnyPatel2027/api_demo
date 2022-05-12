import 'package:api_demo/models/loginResponse.dart';
import 'package:api_demo/services/api_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DashBoardScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.data}) : super(key: key);
  LoginResponse data;
  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    print("${data.toJson()}");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Homescreen"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.network(
                    "https://yssattendance.infikey.buzz/public/profile_pic/${data.user?.profile_pic}",
                    fit: BoxFit.contain,
                    height: 150,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${data.user?.name}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "${data.user?.email}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[400],
                      fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "${data.user?.phone}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                      fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      String token = prefs.get("token").toString();
                      print('token::::::::::$token');
                      apiService
                          .apiGet(token)
                          .then((value) => Get.to(DashBoardScreen(data: value))).catchError((e){
                            Get.snackbar("error", "${e}",snackPosition: SnackPosition.BOTTOM);
                      });
                    },
                    child: Text("DeshBoard"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
