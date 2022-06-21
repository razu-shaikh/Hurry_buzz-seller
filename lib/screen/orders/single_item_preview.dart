
import 'package:ecommerce_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../Model/orderModel.dart';
import '../../widgets/count.dart';
import '../../widgets/product_unit.dart';
import '../notification/notification.dart';
import '../shop/drawer_side.dart';

class SingleItemPreview extends StatefulWidget {
   bool? isBool = false;

   final Orders orderData;
   final int index;
   SingleItemPreview( this.orderData, this.index);

  @override
  _SingleItemState createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItemPreview> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var unitData;
  var firstValue;

  int count=0;
  getCount() {
    setState(() {
     // count = widget.productQuantity?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    // widget.isBool == false ?
    // widget.productUnit.productUnit.firstWhere((element) {
    //   setState(() {
    //     firstValue = element;
    //   });
    //   return true;
    // }):

    getCount();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: Colors.red,
        title:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order Id #"+widget.orderData.orderDetails![0].product!.id.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),

                  ],
                )

              ],
            )

          ],
        ) ,
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundColor:Colors.red,
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => notification()));
              },
              icon:Image.asset("assets/notification.png",width: 25,height: 25,color: Colors.white,),
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     scaffoldKey.currentState?.openDrawer();
          //   },
          //   child: Container(
          //     padding: EdgeInsets.all(8), // Border width
          //     decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(20),
          //       child: SizedBox.fromSize(
          //         size: Size.fromRadius(20), // Image radius
          //         child: Image.network('https://media.gettyimages.com/photos/healthy-fresh-organic-vegetables-in-a-crate-isolated-on-white-picture-id1247073860?s=612x612', fit: BoxFit.cover),
          //       ),
          //     ),
          //   ),
          // ),

        ],
      ),
      // key: scaffoldKey,
      // drawer: Drawer(
      //   child:DrawerSide(),
      // ),
      body:Column(
        children: [
          SizedBox(height: 10),
          Text('Order Details #',//+widget.orderData.orderDetails![widget.index]!.orderId.toString(),
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child:Container(
              margin: EdgeInsets.only(right: 5,left: 5,top:2,bottom:2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi0Xg-k622Sbztlrb-L1o1CAla3zCbVc2lUw&usqp=CAU'),
                      ),
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(10),bottomLeft: Radius.circular(10)),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: widget.isBool == false ?
                          MainAxisAlignment.spaceAround
                              : MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text( widget.orderData.billingAddress!.name.toString(),
                                  style: TextStyle(
                                      color: textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(widget.orderData.orderDetails![0].orderId.toString(),
                                      style: TextStyle(
                                          color: textColor, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "10",
                                      style: TextStyle(
                                          color: textColor, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "min ago",
                                      style: TextStyle(
                                          color: textColor, fontWeight: FontWeight.normal),
                                    ),

                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text("\$"+widget.orderData.orderDetails![0].price.toString(),
                                      style: TextStyle(
                                          color: textColor, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "(1 pics)",
                                      style: TextStyle(
                                          color: textColor, fontWeight: FontWeight.normal),
                                    ),

                                  ],
                                )

                              ],
                            ),

                          ],
                        ),
                      )
                  ),
                  // Container(
                  //   child:Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                  //     child: Text(
                  //       "pending",
                  //       style: TextStyle(
                  //         color: textColor,
                  //         fontWeight: FontWeight.normal,
                  //       ),
                  //     ),
                  //
                  //   ),
                  //   decoration: BoxDecoration(
                  //     color: Colors.yellow,
                  //     borderRadius: BorderRadius.only(topLeft:Radius.circular(5),bottomLeft: Radius.circular(5)),
                  //
                  //   ),
                  //
                  // ),

                ],
              ),
            ),

          ),
        ],
      ),
    );
  }
}