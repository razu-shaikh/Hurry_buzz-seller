import 'package:ecommerce_app/Provider/order_provider.dart';
import 'package:ecommerce_app/screen/orders/single_item.dart';
import 'package:ecommerce_app/screen/orders/single_item_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Order_pages extends StatefulWidget {
  const Order_pages({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Order_pages> {
  late final OrderProvider orderProvider;

  Future<void> initialize() async {
    orderProvider = Provider.of<OrderProvider>(context,listen: false);
    await orderProvider.getProduct();

    setState(() {
    });
  }

  @override
  void initState() {
    initialize();
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
            orderProvider.loading?SizedBox(height:20,width:20,child:CircularProgressIndicator(color:Colors.green)):
            Expanded(
                child: ListView.builder(
                  itemCount: orderProvider.orderList.length,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        child: SingleItem(orderProvider.orderList[index],index),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SingleItemPreview(orderProvider.orderList[index],index))),
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