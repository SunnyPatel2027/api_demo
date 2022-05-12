import 'package:api_demo/models/loginResponse.dart';
import 'package:api_demo/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailCtrl = TextEditingController(text: "masteradmin@demo.com");
    final passwordCtrl = TextEditingController(text: 'password');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Login"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailCtrl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter email"),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordCtrl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter password"),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  var apiService = ApiService();
                  try {
                    apiService
                        .apiPost({
                          'email': emailCtrl.text,
                          'password': passwordCtrl.text
                        })
                        .then(
                            (value) async{
                              Get.snackbar(
                                  "Success", 'Login successfully',
                                  snackPosition: SnackPosition.BOTTOM);
                              print("${value.user}");
                              Get.off(HomeScreen(data: value,));
                              final prefs = await SharedPreferences.getInstance();
                              await prefs.setString("token", (value.token).toString());
                            }
                            )
                        .catchError((error) {
                          Get.snackbar("Error", '$error',
                              snackPosition: SnackPosition.BOTTOM);
                        });
                  } catch (e) {
                    Get.snackbar("Error", '$e',
                        snackPosition: SnackPosition.BOTTOM);
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
