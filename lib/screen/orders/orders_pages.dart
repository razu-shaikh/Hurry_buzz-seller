import 'dart:convert';

import 'package:ecommerce_app/Model/orderModel.dart';
import 'package:ecommerce_app/screen/orders/single_item.dart';
import 'package:ecommerce_app/screen/orders/single_item_preview.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Order_pages extends StatefulWidget {
  const Order_pages({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Order_pages> {
  bool _loading = false;
  bool get loading => _loading;
  
    
  setLoading(bool value){
    _loading = value;
  }

  Future<OrderModel > initialize() async {
    setLoading(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? authToken = pref.getString("token");
    print("token"+authToken.toString());
      final response = await http.post(Uri.parse('https://hurrybuzz.com/api/v1/seller/orders'),
            headers: {
              "apiKey": "sdfdge544364dg#",
              "Authorization": "Bearer $authToken"},
      );

      var data = jsonDecode(response.body.toString());
      if(response.statusCode == 200){
        return OrderModel.fromJson(data);
      }else{
        return OrderModel.fromJson(data);
      }
  }

  @override
  void initState() {
    initialize();
    setLoading(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 52,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    //query = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color(0xfff3f1f1),
                  filled: true,
                  hintText: "Search for items in the store",
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
             //loading?SizedBox(height:20,width:20,child:CircularProgressIndicator(color:Colors.green)):
            Expanded(
              child: FutureBuilder<OrderModel>(
                future: initialize(),
                builder: (context,snapShot){
                  if(snapShot.hasData){
                    return ListView.builder(
                        itemCount: snapShot.data!.orders!.length,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            child: SingleItem(snapShot.data!.orders![index],index),
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SingleItemPreview(snapShot.data!.orders![index],index))),
                          );
                        }
                    );
                  }
                  else{
                    return Center(
                      child:SizedBox(height:20,width:20,child:CircularProgressIndicator(color:Colors.green)) ,

                    );
                  }

                }

              )

            ),
       ],
    ),
      ),
    );
  }
}