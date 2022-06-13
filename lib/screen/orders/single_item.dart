import 'package:ecommerce_app/Model/order_model.dart';
import 'package:ecommerce_app/config/colors.dart';
import 'package:flutter/material.dart';

class SingleItem extends StatefulWidget {
  bool? isBool = false;

  final Order orderData;
  final int index;
  SingleItem( this.orderData, this.index);
  @override
  _SingleItemState createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  //late ReviewCartProvider reviewCartProvider;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(width: 1, color: Color(0xFFD4D4D4))),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
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
                                widget.orderData.billingAddress!.name.toString(),
                                // "product name",
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
                                    widget.orderData.orderDetails![widget.index]!.orderId.toString(),
                                    style: TextStyle(
                                        color: textColor, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.orderData.orderDate.toString(),
                                    style: TextStyle(
                                        color: textColor, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\$"+widget.orderData.orderDetails![widget.index]!.price.toString(),
                                    style: TextStyle(
                                        color: textColor, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.orderData.orderDetails![widget.index]!.quantity.toString()+"( pics)",
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
                      widget.orderData.deliveryStatus.toString(),
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                  ),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(5)),

                  ),

                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}