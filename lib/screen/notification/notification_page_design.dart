import 'package:ecommerce_app/config/colors.dart';
import 'package:flutter/material.dart';

class SingalNotification extends StatefulWidget {

  @override
  _SingalProductState createState() => _SingalProductState();
}

class _SingalProductState extends State<SingalNotification> {
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
            height: 120,
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
                          "Very Good Product",
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
                            "SirajGonj  8 AM - 5 PM",
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                              },
                              icon: Icon(
                                Icons.star,
                                size: 20,
                                color: textColor,
                              ),
                            ),
                            Text('5.0', textAlign: TextAlign.left, style: TextStyle(fontSize: 18)),
                            const SizedBox(
                              width: 5,
                            ),
                            Text('(By 2000 people)', textAlign: TextAlign.left, style: TextStyle(fontSize: 13)),
                          ],
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
                        color: Color(0xff929792),
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(Icons.remove,color: Colors.white,)
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}