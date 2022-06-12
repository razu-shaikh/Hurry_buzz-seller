import 'package:ecommerce_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SingleCampaignItem extends StatefulWidget {
  get isBool => null;


  @override
  _SingleItemState createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleCampaignItem> {
  //late ReviewCartProvider reviewCartProvider;

  bool? isBool = false;
  var unitData;
  var firstValue;

  int count=0;
  getCount() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child:Container(
            margin: EdgeInsets.only(right: 5,left: 5,top:2,bottom:2),
            height: 120,
            decoration: BoxDecoration(
              color: Color(0xfff3f1f1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://media.gettyimages.com/photos/healthy-fresh-organic-vegetables-in-a-crate-isolated-on-white-picture-id1247073860?s=612x612'),
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
                Padding(
                  padding: EdgeInsets.only(top: 50,right: 6),
                  child: Container(
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      child: Text(
                        "status",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),

                    ),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(5),

                    ),

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