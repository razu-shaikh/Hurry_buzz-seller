import 'dart:convert';

import 'package:ecommerce_app/Model/offerModel.dart';
import 'package:ecommerce_app/auth/screens/login_screen.dart';
import 'package:ecommerce_app/screen/offers/item_design.dart';
import 'package:ecommerce_app/screen/offers/item_single.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AllOfferList extends StatefulWidget {
  const AllOfferList({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AllOfferList> {

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
  }

  Future<OfferModel> initialize() async {
    setLoading(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? authToken = pref.getString("token");
    print("token"+authToken.toString());
    final response = await http.post(Uri.parse('https://hurrybuzz.com/api/v1/seller/offers'),
      headers: {
        "apiKey": "sdfdge544364dg#",
        "Authorization": "Bearer $authToken"},
    );
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      setLoading(false);
      return OfferModel.fromJson(data);
    }else if(response.statusCode == 401){
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.remove("token");
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
              (Route<dynamic> route) => false
      );
      return OfferModel.fromJson(data) ;
    }else{
      setLoading(false);
        return OfferModel.fromJson(data) ;

    }
  }

  @override
  void initState() {
    initialize();
    setLoading(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // const SizedBox(
              //   height: 10,
              // ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text("Offers and Campaign",style: TextStyle(color:Colors.black,fontSize:20),),
                  )),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child:loading?CircularProgressIndicator(color:Colors.blue): FutureBuilder<OfferModel>(
                      future: initialize(),
                      builder: (context,snapShot){
                        if(snapShot.hasData){
                          return ListView.builder(
                              itemCount: snapShot.data!.offers!.length,
                              itemBuilder: (context, index){
                                return GestureDetector(
                                  child: ItemDesign(snapShot.data!.offers![index]),
                                  onTap: () => Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => ItemSingleDesign(snapShot.data!.offers![index]))),
                                );
                              }
                          );
                        } else{
                             return Center(child: Text("No data found !!"));
                          return Center(
                            child:SizedBox(height:20,width:20,child:CircularProgressIndicator(color:Colors.green)) ,

                          );
                        }

                      }

                  )
                  // child: ListView.builder(
                  //     itemCount: 10,
                  //     itemBuilder: (context, index){
                  //       return GestureDetector(
                  //         child: ItemDesign(),
                  //         onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ItemSingleDesign())),
                  //       );
                  //     }
                  //
                  // )
              ),

            ],
          ),
        )
    );
  }
}