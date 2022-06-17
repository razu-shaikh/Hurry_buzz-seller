import 'package:ecommerce_app/Model/offerModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemDesign extends StatefulWidget {
  Offers offers;
  ItemDesign(this.offers, {Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ItemDesign> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red,
    ));
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child:Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10)),
              side: BorderSide(width: 1, color: Color(0xFFD4D4D4))),
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://cdn.shopify.com/s/files/1/0623/0687/7667/articles/3-Reasons-Getting-Those-Fresh-Veggies-To-Your-Table-Is-More-Complicated-Than-You-Think.jpg?v=1642268664'),
                  ),
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      widget.offers.campaign!.currentLanguage![0].title.toString(),
                      //"Buy 1 Get i Free"
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.offers.campaign!.campaignStartDate.toString()+"-"+widget.offers.campaign!.campaignEndDate.toString(),
                      // '1 January- 5 January 2022',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ) ,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    widget.offers.campaign!.currentLanguage![0].description.toString()+"first come first get hurry up avaiable "
                        "from 31 st to 05 , come first get first",
                    //'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3
                ),
              ),
            ],
          ) ,
        )
    );
  }
}