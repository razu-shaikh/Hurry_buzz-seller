import 'package:ecommerce_app/Model/shop_model.dart';
import 'package:ecommerce_app/config/colors.dart';
import 'package:ecommerce_app/screen/shop/allProduct/all_productList.dart';
import 'package:flutter/material.dart';

class SingalProduct extends StatefulWidget {

  final ShopAllProducts productData;
  SingalProduct( this.productData,);

  @override
  _SingalProductState createState() => _SingalProductState();
}

class _SingalProductState extends State<SingalProduct> {
  var unitData;
  var firstValue;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(width: 1, color: Color(0xFFD4D4D4))),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
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
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.productData.productName.toString(),
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: Text(
                                widget.productData.discountPercentage.toString(),
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "\$"+ widget.productData.price.toString(),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Container(
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.only(right: 10,top:5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(Icons.edit_outlined)
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}