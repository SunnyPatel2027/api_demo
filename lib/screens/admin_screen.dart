import 'package:api_demo/models/getResponse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({Key? key, required this.data}) : super(key: key);
  DashBoardModal data;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Clients"),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            width: double.infinity,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data.recent_admins.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 2),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              child: Image.network(
                                "https://yssattendance.infikey.buzz/public/profile_pic/${data
                                    .recent_admins[index].profile_pic}",errorBuilder: ( context,  exception,  stackTrace) {
                                return Center(child: Icon(Icons.person),heightFactor: 4,widthFactor: 4,);
                              },height
                                : 100, width: 100,),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
                                  children: [
                                    Text("${data.recent_admins[index].name}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),),
                                    SizedBox(height: 8,),
                                    Text("${data.recent_admins[index].email}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Colors.grey),),
                                    SizedBox(height: 10,),
                                    Text("${data.recent_admins[index].phone}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Colors.black54),),
                                  ],
                                ),
                              ),
                            ),
                            Text("id: ${data.recent_admins[index].id}",
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black54),),
                          ],
                        ),
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
