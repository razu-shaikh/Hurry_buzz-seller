import 'package:ecommerce_app/config/colors.dart';
import 'package:ecommerce_app/screen/orders/single_item.dart';
import 'package:ecommerce_app/screen/orders/single_item_preview.dart';
import 'package:flutter/material.dart';

class Order_pages extends StatefulWidget {
  const Order_pages({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Order_pages> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  fillColor: Color(0xffc2c2c2),
                  filled: true,
                  hintText: "Search for items in the store",
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: 10,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        child: SingleItem(),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SingleItemPreview())),
                      );
                    }
                )
            ),
       ],
    ),
      ),
    );
  }
}