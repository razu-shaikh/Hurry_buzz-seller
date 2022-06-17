import 'package:dio/dio.dart';
import 'package:ecommerce_app/Model/shop_type_model.dart';
import 'package:flutter/material.dart';

class ShopTypeDropDown extends StatefulWidget {
  State createState() => new MyAppState();
}
class MyAppState extends State<ShopTypeDropDown> {

  ShopType? dashboardData;
  List<ShopType?>orderState = [];

  Future<void> shopTypeMethod() async {
    try {
      Response response = (await Dio().post('https://hurrybuzz.com/api/v1/seller/shop_types',
        options: Options(
          headers: {
            "apiKey": "sdfdge544364dg#"},),
      )) ;

      Map<String,dynamic> dashboardDataList= response.data;
      print(dashboardDataList);
     if(response.statusCode==200){
       dashboardData = ShopType.fromJson(response.data);
       print(dashboardData);

     }

    } catch (e) {
       print(e.toString);
    }
  }


  User? selectedUser;
  int? value;
  List<User> users = <User>[ User(1,'Foo'),  User(2,'Bar')];

  @override
  void initState() {
    shopTypeMethod();
    selectedUser=users[0];
  }

  @override
  Widget build(BuildContext context) {
   // print(users);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child:  DropdownButton<User>(
            underline: SizedBox(),
            value: selectedUser,
            isExpanded: true,
            iconSize: 36,
            onChanged: (User? newValue) {
              setState(() {
                selectedUser = newValue;
                value = selectedUser!.id;
                print(value);
              });
            },
            items: users.map((User user) {
              return  DropdownMenuItem<User>(
                value: user,
                child:  Text(
                  user.name,
                  style:  TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
class User {
  User(this.id,this.name);

  final String name;
  final int id;
}