import 'package:api_demo/models/getResponse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Employees_screen.dart';
import 'admin_screen.dart';
import 'claints_screen.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({Key? key, required this.data}) : super(key: key);
  final DashBoardModal data;

  Widget cartList(String text, int count, Function() onPress) {
    return Card(
      elevation: 5,
      child: ListTile(
        onTap: onPress,
        title: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: Text(
          "${count}",
          style: TextStyle(
              color: Colors.redAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("${data.message}"),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 12),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                cartList("Total Admins", data.total_admins,(){Get.to(AdminScreen(data : data));}),
                SizedBox(
                  height: 10,
                ),
                cartList("Total Employees", data.total_employees,
                    (){Get.to(EmployeesScreen(data : data));}),
                SizedBox(
                  height: 10,
                ),
                cartList("Total Clients", data.total_clients,(){ Get.to(ClientsScreen(data : data));}),
              ],
            )),
      ),
    );
  }
}
