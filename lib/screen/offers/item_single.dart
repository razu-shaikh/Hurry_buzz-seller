
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/colors.dart';

class ItemSingleDesign extends StatefulWidget {
  ItemSingleDesign({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ItemSingleDesign> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red,
    ));

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
      body:Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child:Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10))),
            child: Column(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi0Xg-k622Sbztlrb-L1o1CAla3zCbVc2lUw&usqp=CAU'),
                    ),
                    color: Colors.red,
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Buy 1 Get 1 Free',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '1 January- 5 January 2022',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ) ,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ) ,
          )
      ) ,
    ) ;
  }
}