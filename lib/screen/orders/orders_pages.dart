import 'dart:convert';

import 'package:ecommerce_app/Model/orderModel.dart';
import 'package:ecommerce_app/auth/widgets/text_field_container.dart';
import 'package:ecommerce_app/screen/orders/single_item.dart';
import 'package:ecommerce_app/screen/orders/single_item_preview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Order_pages extends StatefulWidget {
  const Order_pages({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Order_pages> {
  bool _loading = false;
  bool get loading => _loading;
  
    
  setLoading(bool value){
    _loading = value;
  }
  var shopSelection;
  var stateSelection ;
  final String url = "https://hurrybuzz.com/api/v1/seller/";
  List shopData = []; //edited line
  Future<String> getSWDataShop() async {
    var res = await http
        .post(Uri.parse(url+"shop_types"),
        headers: {"apiKey": "sdfdge544364dg#"});
    var resBody = jsonDecode(res.body);
    setState(() {
      shopData = resBody;
    });
    return "Sucess";
  }

  List stateData = []; //edited line
  Future<String> getSWDataState() async {
    var res = await http
        .post(Uri.parse(url+"states"),
        headers: {"apiKey": "sdfdge544364dg#"});
    var resBody = jsonDecode(res.body);
    setState(() {
      stateData = resBody;
    });
    return "Sucess";
  }

  Future<OrderModel > initialize() async {
    setLoading(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? authToken = pref.getString("token");
    print("token"+authToken.toString());
      final response = await http.post(Uri.parse('https://hurrybuzz.com/api/v1/seller/orders'),
            headers: {
              "apiKey": "sdfdge544364dg#",
              "Authorization": "Bearer $authToken"},
      );

      var data = jsonDecode(response.body.toString());
      if(response.statusCode == 200){
        return OrderModel.fromJson(data);
      }else{
        return OrderModel.fromJson(data);
      }
  }

  @override
  void initState() {
    initialize();
    setLoading(false);
    getSWDataShop();
    getSWDataState();
    super.initState();
  }

  Future<void>_showChoiceDialog(BuildContext context)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 10),
               // padding: EdgeInsets.symmetric(horizontal:12 ,vertical:4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color:Colors.black26,width: 1)
                ),
                //child: ShopTypeDropDown(shopSelection),
                child: DropdownButton(
                  hint: Text("Delivery Status"),
                  underline: SizedBox(),
                  isExpanded: true,
                  iconSize: 36,
                  items: shopData.map((item) {
                    return DropdownMenuItem(
                      child: Text(item['name']),
                      value: item['id'],
                    );
                  }).toList(),
                  onChanged: ( newVal) {
                    setState(() {
                      shopSelection = newVal;
                    });
                  },
                  value: shopSelection,
                ),

              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 10),
               // padding: EdgeInsets.symmetric(horizontal:12 ,vertical:4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color:Colors.black26,width: 1)
                ),
                // child:StateTypeDropDown(stateSelection),
                child: DropdownButton(
                  hint: Text("Order By"),
                  underline: SizedBox(),
                  isExpanded: true,
                  iconSize: 36,
                  items: stateData.map((item) {
                    return DropdownMenuItem(
                      child: Text(item['name']),
                      value: item['id'],
                    );
                  }).toList(),
                  onChanged: ( newVal) {
                    setState(() {
                      stateSelection = newVal;
                    });
                  },
                  value: stateSelection,
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                    cursorColor: Colors.black26,
                    decoration: InputDecoration(
                        hintText: "Filter by date Range",
                        border: InputBorder.none),
                   // controller: lonController,
                   //  validator: (lonController)=>
                   //  lonController!= null && lonController.isEmpty?
                   //  "Enter Longitude"
                   //      :null
                ),
              ),
              InkWell(
                onTap: () async{

                },
                child: Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 10),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                       child://loading? CircularProgressIndicator(color:Colors.white):
                      Text("Filter",style: GoogleFonts.besley(fontSize: 18,color:Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, // light
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 52,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    //query = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color(0xfff3f1f1),
                  filled: true,
                  hintText: "Search for items in the store",
                  suffixIcon: IconButton(
                    onPressed: () => _showChoiceDialog(context),
                    icon: Icon(Icons.filter_list_sharp),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
             //loading?SizedBox(height:20,width:20,child:CircularProgressIndicator(color:Colors.green)):
            Expanded(
              child: FutureBuilder<OrderModel>(
                future: initialize(),
                builder: (context,snapShot){
                  if(snapShot.hasData){
                    return ListView.builder(
                        itemCount: snapShot.data!.orders!.length,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            child: SingleItem(snapShot.data!.orders![index],index),
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SingleItemPreview(snapShot.data!.orders![index],index))),
                          );
                        }
                    );
                  }
                  else{
                    return Center(
                      child:SizedBox(height:20,width:20,child:CircularProgressIndicator(color:Colors.green)) ,

                    );
                  }

                }

              )

            ),
       ],
    ),
      ),
    );
  }
}