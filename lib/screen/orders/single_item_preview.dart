import 'package:ecommerce_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../widgets/count.dart';
import '../../widgets/product_unit.dart';

class SingleItemPreview extends StatefulWidget {
   bool? isBool = false;
  // String? productId;
  // String? productImage;
  // String? productName;
  // bool? wishList = false;
  // int? productPrice;
  // int? productQuantity;
  // final void Function()? onDelete;
  // var productUnit;
  // // final ProductModel? unitProduct;
  //
  // SingleItem(
  //     {this.productQuantity,
  //       this.productId,
  //       this.productUnit,
  //       this.onDelete,
  //       this.isBool,
  //       this.productImage,
  //       this.productName,
  //       this.productPrice,
  //       this.wishList,
  //       //this.unitProduct
  //     });

  @override
  _SingleItemState createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItemPreview> {
  //late ReviewCartProvider reviewCartProvider;

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
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: Colors.red,
        title: Text('Sale Report',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        actions: [
          const SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor:Colors.red,
            child: IconButton(
              onPressed: () {
              },
              icon: Icon(
                Icons.add_alert_outlined,
                size: 20,
                color: textColor,
              ),
            ),
          ),

        ],
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child:Container(
              margin: EdgeInsets.only(right: 5,left: 5,top:2,bottom:2),
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xffd9dad9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi0Xg-k622Sbztlrb-L1o1CAla3zCbVc2lUw&usqp=CAU'),
                      ),
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(10),bottomLeft: Radius.circular(10)),
                    ),
                  ),
                  Container(
                      height: 120,
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
                                Text(
                                  "product name",
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
                                    Text(
                                      "#123456",
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
                                    Text(
                                      "\$10",
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
                  Container(
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                      child: Text(
                        "pending",
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),

                    ),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(5),bottomLeft: Radius.circular(5)),

                    ),

                  ),

                ],
              ),
            ),

          ),
        ],
      ),
    );
  }
}