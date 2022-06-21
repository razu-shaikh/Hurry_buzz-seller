import 'package:ecommerce_app/Model/offerModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../config/colors.dart';
import '../notification/notification.dart';
import '../shop/drawer_side.dart';

class ItemSingleDesign extends StatefulWidget {
  Offers offers;
  ItemSingleDesign(this.offers, {Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ItemSingleDesign> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red,
    ));

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
                    Text(widget.offers.campaign!.currentLanguage![0].title.toString(),
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
      body:Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Column(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://media.gettyimages.com/photos/healthy-fresh-organic-vegetables-in-a-crate-isolated-on-white-picture-id1247073860?s=612x612'),
                    ),
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(widget.offers.campaign!.currentLanguage![0].title.toString(),
                        //'Buy 1 Get 1 Free',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text( widget.offers.campaign!.campaignStartDate.toString()+"-"+widget.offers.campaign!.campaignEndDate.toString(),
                        //'1 January- 5 January 2022',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ) ,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text( widget.offers.campaign!.currentLanguage![0].description.toString()+"first come first get hurry up avaiable "
                      "from 31 st to 05 , come first get first",
                      //'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ) ,
      ) ,
    ) ;
  }
}