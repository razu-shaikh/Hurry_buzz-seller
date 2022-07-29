import 'dart:convert';
import 'package:ecommerce_app/Model/shopModel.dart';
import 'package:ecommerce_app/auth/screens/login_screen.dart';
import 'package:ecommerce_app/screen/notification/webView.dart';
import 'package:ecommerce_app/screen/shop/allProduct/tab_bar.dart';
import 'package:ecommerce_app/screen/shop/updateShop.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    setState(() {
      _loading = value;

    });
  }
  Future<ShopModel> initialize() async {
    setLoading(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? authToken = pref.getString("token");
    final response = await http.post(Uri.parse('https://hurrybuzz.com/api/v1/seller/shop'),
      headers: {
        "apiKey": "sdfdge544364dg#",
        "Authorization": "Bearer $authToken"},
    );
     var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      return ShopModel.fromJson(data);
    }else if(response.statusCode == 401){
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.remove("token");
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
              (Route<dynamic> route) => false
      );
      return ShopModel.fromJson(data);
    }else{
      setLoading(false);
      return ShopModel.fromJson(data);
    }
  }


  @override
  void initState() {
    setLoading(false);
      initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red,
    ));
    String? phoneNumber ="";
    String? shopName ;
    String? slug;
    String? address;
    String? lat;
    String? lon;
    var shopTypeId;
    var stateId;
    var cityId;
    var townId;
    String? metaTitle;
    String? metaDescription;
    String? licenseNo;
    String? shopType;
    String? logo;
    String? banner;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
           FutureBuilder<ShopModel>(
           future: initialize(),
           builder: (context,snapShot){
             if(snapShot.hasData){
               logo = snapShot.data!.shopDetails!.logo!.originalImage;
               banner = snapShot.data!.shopDetails!.banner!.originalImage;
             }
            return Container(
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://hurrybuzz.com/public/'+banner.toString()),
                ),
                color: Colors.red,
                borderRadius: BorderRadius.only(bottomRight:Radius.circular(10),bottomLeft: Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40,right: 220),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color(0xffd1ad17),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child:Container (
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://hurrybuzz.com/public/'+logo.toString()),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateShop(
                         logo??"",
                         banner??"",
                          phoneNumber??"",
                          shopName??"",
                          slug!,
                          address!,
                          lat!,
                          lon!,
                          shopTypeId,
                          stateId,
                          cityId,
                          townId,
                          metaTitle??"",
                          metaDescription??"",
                          licenseNo??""
                      ))).then((value) => initialize());
                    },
                    child: Container(
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.only(right: 10,bottom: 60),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(Icons.edit_outlined, color: Colors.black,)
                    ),
                  ),
                ],
              ),
            );
           }
           ),
          SizedBox( // <-- use a sized box and change the height
            height: 45.0,
            child:Padding(
              padding: const EdgeInsets.only(left: 16,top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                      FutureBuilder<ShopModel>(
                          future: initialize(),
                          builder: (context,snapShot){
                            if(snapShot.hasData){
                                phoneNumber = snapShot.data!.shopDetails!.phoneNo;
                                shopName = snapShot.data!.shopDetails!.shopName;
                                slug =snapShot.data!.shopDetails!.slug;
                                address= snapShot.data!.shopDetails!.address;
                                lat = snapShot.data!.shopDetails!.latitude;
                                lon = snapShot.data!.shopDetails!.longitude;
                                shopTypeId = snapShot.data!.shopDetails!.shopTypeId;
                                stateId = snapShot.data!.shopDetails!.stateId;
                                cityId = snapShot.data!.shopDetails!.cityId;
                                townId = snapShot.data!.shopDetails!.townId;
                                metaTitle = snapShot.data!.shopDetails!.metaTitle;
                                metaDescription = snapShot.data!.shopDetails!.metaDescription;
                                licenseNo = snapShot.data!.shopDetails!.licenseNo;
                                licenseNo = snapShot.data!.shopDetails!.licenseNo;
                                shopType =snapShot.data!.shopType;
                              return Column(
                                children: [
                                  Text(shopName.toString(), textAlign: TextAlign.left, style: TextStyle(fontSize: 18)),
                                  Text(shopType.toString(), textAlign: TextAlign.left, style: TextStyle(fontSize: 13)),
                                ],
                              );

                            }else{
                              return Center(
                                child:SizedBox() ,

                              );
                            }

                          }),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewNotification(slug)));
                        },
                        icon: ImageIcon( AssetImage("assets/earth.png"),
                          size: 23,),
                      ),
                      IconButton(
                        onPressed: () async{
                          await Share.share("Share somethings");

                        },
                        icon: Icon(
                          Icons.share,
                          size: 20,
                          color: textColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox( // <-- use a sized box and change the height
            height: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<ShopModel>(
                      future: initialize(),
                      builder: (context,snapShot){
                        return Row(
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

                            Padding(
                                padding: EdgeInsets.only(top:8),
                                child: Text(snapShot.hasData? snapShot.data!.shopDetails!.ratingCount.toString():"", textAlign: TextAlign.left, style: TextStyle(fontSize: 18))),
                            SizedBox(
                              width: 5,
                            ),
                            Padding(
                                padding: EdgeInsets.only(top:8),
                                child: Text('(By ${snapShot.hasData? snapShot.data!.shopDetails!.reviewsCount.toString():""} people)', textAlign: TextAlign.left, style: TextStyle(fontSize: 13))),
                          ],
                        );

                      }

                  ),
                  FutureBuilder<ShopModel>(
                      future: initialize(),
                      builder: (context,snapShot){
                        return Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                },
                                icon: Icon(
                                  Icons.shop_outlined,
                                  size: 20,
                                  color: textColor,
                                ),
                              ),
                            Padding(
                                padding: EdgeInsets.only(top:10),
                                child: Text(snapShot.hasData?"${snapShot.data!.allProducts!.length}":"", textAlign: TextAlign.left, style: TextStyle(fontSize: 18))),
                            SizedBox(
                              width: 30,
                            ),
                          ],
                        );
                      })
                ],
              ),
          ),
          FutureBuilder<ShopModel>(
              future: initialize(),
              builder: (context,snapShot){
                if(snapShot.hasData){
                  return TabBar_shop(snapShot.data!);
                }else{
                  return Center(
                    child:SizedBox(height:20,width:20,child:CircularProgressIndicator(color:Colors.green)) ,

                  );
                }

              }),
        ],
      ),
    );
  }
}