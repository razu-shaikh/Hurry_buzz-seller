import 'package:ecommerce_app/config/colors.dart';
import 'package:flutter/material.dart';

class SingalProduct extends StatefulWidget {

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
          Container(
            margin: EdgeInsets.only(right: 10,left: 10,top:5,bottom:5),
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xfff3f1f1),
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
                    padding: const EdgeInsets.only(left: 10,top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                         "product name",
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
                            "10% off",
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
                          '${"200"}\$/${unitData ?? firstValue}',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),

                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: ProductUnit(
                        //         onTap: () {
                        //           showModalBottomSheet(
                        //               context: context,
                        //               builder: (context) {
                        //                 return Column(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   crossAxisAlignment: CrossAxisAlignment.start,
                        //                   children: widget.productUnit.productUnit.map<Widget>((data) {
                        //                     return Column(
                        //                       children: [
                        //                         Padding(
                        //                           padding: const EdgeInsets
                        //                               .symmetric(
                        //                               vertical: 10,
                        //                               horizontal: 10),
                        //                           child: InkWell(
                        //                             onTap: () async {
                        //                               setState(() {
                        //                                 unitData = data;
                        //                               });
                        //                               Navigator.of(context)
                        //                                   .pop();
                        //                             },
                        //                             child: Text(
                        //                               data,
                        //                               style: TextStyle(
                        //                                   color: primaryColor,
                        //                                   fontSize: 18),
                        //                             ),
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     );
                        //                   }).toList(),
                        //                 );
                        //               });
                        //         },
                        //         title: unitData ?? firstValue,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 5,
                        //     ),
                        //     Count(
                        //       productId: widget.productId,
                        //       productImage: widget.productImage,
                        //       productName: widget.productName,
                        //       productPrice: widget.productPrice,
                        //       productUnit: unitData ?? firstValue,
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                    margin: EdgeInsets.only(right: 10,top:5),
                  decoration: BoxDecoration(
                  color: Color(0xff929792),
                  borderRadius: BorderRadius.circular(5)),
                  child: Icon(Icons.edit)
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}