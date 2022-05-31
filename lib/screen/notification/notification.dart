import 'package:ecommerce_app/config/colors.dart';
import 'package:ecommerce_app/screen/orders/single_item.dart';
import 'package:ecommerce_app/screen/orders/single_item_preview.dart';
import 'package:flutter/material.dart';

import 'notification_page_design.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<notification> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: Colors.red,
        title:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Dhaka",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
              Text('Mohammadpur Dhaka 1212',style: TextStyle(color: Colors.white, fontSize: 12),
              ),

          ],
        ) ,
        actions: [
            Container(
              padding: EdgeInsets.all(8), // Border width
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox.fromSize(
                  size: Size.fromRadius(20), // Image radius
                  child: Image.network('https://media.gettyimages.com/photos/healthy-fresh-organic-vegetables-in-a-crate-isolated-on-white-picture-id1247073860?s=612x612', fit: BoxFit.cover),
                ),
              ),
            ),
          CircleAvatar(
            radius: 20,
            backgroundColor:Colors.red,
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => notification()));
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              ),
            ),
          ),
        ],
      ),
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
            Text('Notification',style: TextStyle(color: Colors.black, fontSize: 15)),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        child: SingalNotification(),
                        //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SingleItemPreview())),
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