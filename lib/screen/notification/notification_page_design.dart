import 'package:ecommerce_app/Model/notificationModel.dart';
import 'package:ecommerce_app/config/colors.dart';
import 'package:flutter/material.dart';

class SingalNotification extends StatefulWidget {
  Notifications notifications;
  SingalNotification(this.notifications);


  @override
  _SingalProductState createState() => _SingalProductState();
}

class _SingalProductState extends State<SingalNotification> {
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
                              ''),
                        ),
                        borderRadius: BorderRadius.only(topLeft:Radius.circular(10),bottomLeft: Radius.circular(10)),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.notifications.title.toString(),
                              //"Very Good Product",
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
                                widget.notifications.date.toString(),
                               // "SirajGonj  8 AM - 5 PM",
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            // Container(
                            //   child: Row(
                            //     children: [
                            //       IconButton(
                            //         onPressed: () {
                            //         },
                            //         icon: Icon(
                            //           Icons.star,
                            //           size: 15,
                            //           color: textColor,
                            //         ),
                            //       ),
                            //       Text('5.0', textAlign: TextAlign.left, style: TextStyle(fontSize: 15)),
                            //       const SizedBox(
                            //         width: 5,
                            //       ),
                            //       Text('(By 2000 people)', textAlign: TextAlign.left, style: TextStyle(fontSize: 13)),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                        child: Text(
                          widget.notifications.status.toString(),
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),

                      ),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.only(topRight:Radius.circular(10) ),

                      ),

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



