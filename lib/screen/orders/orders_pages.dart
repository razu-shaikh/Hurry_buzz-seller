import 'dart:convert';
import 'dart:ui';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/Model/OrderModel.dart';
import 'package:ecommerce_app/auth/screens/login_screen.dart';
import 'package:ecommerce_app/auth/widgets/text_field_container.dart';
import 'package:ecommerce_app/screen/orders/single_item.dart';
import 'package:ecommerce_app/screen/orders/single_item_preview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Order_pages extends StatefulWidget {
  const Order_pages({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Order_pages> {
  bool _loading = true;
  bool get loading => _loading;

  setLoading(bool value){
    setState(() {
      _loading = value;
    });
  }

  OrderModel? orderModel;

  Future<void> initialize() async {
    //print("initializing=====");
    setLoading(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? authToken = pref.getString("token");
    print("token"+authToken.toString());
      final response = await http.post(Uri.parse('https://hurrybuzz.com/api/v1/seller/orders'),
            headers: {
              "apiKey": "sdfdge544364dg#",
              "Authorization": "Bearer $authToken"},
      );

      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        orderModel = OrderModel.fromJson(data);
        // return OrderModel.fromJson(data);
        setLoading(false);
      }else if(response.statusCode == 401){
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.remove("token");
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
                (Route<dynamic> route) => false
        );
      }else{
        setLoading(false);
      }

    setLoading(false);
  }

  Future<void> filterValue(String deliveryValue , String dateTime) async{
    setLoading(true);
    print("filter =====");
    print("deliveryValue === $deliveryValue");
    print("dateTime === $dateTime");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? authToken = pref.getString("token");
    Response response = await Dio().post('https://hurrybuzz.com/api/v1/seller/orders/filter',
      options: Options(
        headers: {
          "apiKey": "sdfdge544364dg#","Authorization": "Bearer $authToken"},),
      data: {
        'ds': deliveryValue,
        'dt': dateTime,
      },
    );
    // final response = await http.post(Uri.parse('https://hurrybuzz.com/api/v1/seller/orders/filter'),
    //   headers: {
    //     "apiKey": "sdfdge544364dg#",
    //     "Authorization": "Bearer $authToken"},
    //   body: json.encode(body),
    // );
    if(response.statusCode == 200){
      // var data = jsonDecode(response.body.toString());
      // print(data);
      setState(() {
        orderModel = OrderModel.fromJson(response.data);
        setLoading(false);
      });
      // return OrderModel.fromJson(data);
     }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("hhhhhhhhhh"),

      ));
      setLoading(false);
    }
    setLoading(false);
  }

  @override
  void initState() {
    initialize();
    setLoading(false);
    super.initState();
  }


  showChoiceDialog(BuildContext context) {
    final format = DateFormat('MM-dd-yyyy hh:mm:a');
    return showDialog(context: context,builder: (BuildContext context){
      TextEditingController startController = TextEditingController();
      TextEditingController endController = TextEditingController();
      var orderBy;
      var dropdownvalue;
      var deliveryItems = [
        'pending',
        'confirm',
        'on_the_way',
        'picked_up',
      ];
      return AlertDialog(
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
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
                    focusColor: Colors.black26,
                    isExpanded: true,
                    iconSize: 36,
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    items: deliveryItems.map((items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                    // validator: (dropdownvalue)=>
                    // dropdownvalue!= null && dropdownvalue == 0?
                    // "Select account type"
                    //     :null
                    value: dropdownvalue,
                  ),

                ),
                SizedBox(height: 10),
                // Container(
                //   padding: EdgeInsets.only(left: 20,right: 20,top: 10),
                //  // padding: EdgeInsets.symmetric(horizontal:12 ,vertical:4),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(12),
                //       border: Border.all(color:Colors.black26,width: 1)
                //   ),
                //   // child:StateTypeDropDown(stateSelection),
                //   child: DropdownButton(
                //     hint: Text("Order By"),
                //     underline: SizedBox(),
                //     isExpanded: true,
                //     iconSize: 36,
                //     items: stateData.map((item) {
                //       return DropdownMenuItem(
                //         child: Text(item['name']),
                //         value: item['id'],
                //       );
                //     }).toList(),
                //     onChanged: ( newVal) {
                //       setState(() {
                //         stateSelection = newVal;
                //       });
                //     },
                //     value: stateSelection,
                //   ),
                // ),
                TextFieldContainer(
                  child:Column(
                   children: [
                     DateTimeField(
                       format: format,
                       decoration: InputDecoration(
                           hintText: "start date "
                       ),
                       onShowPicker: (context,currentValue) async{
                         final date = await showDatePicker(context: context,
                             initialDate: currentValue?? DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2100));
                         if(date != null){
                           final time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(currentValue??DateTime.now()));
                           return DateTimeField.combine(date, time);
                         }else{
                           return currentValue;
                         }

                       },
                       controller:startController,
                     ),
                     DateTimeField(
                       format: format,
                       decoration: InputDecoration(
                           hintText: "end date "
                       ),
                       onShowPicker: (context,currentValue) async{
                         final date = await showDatePicker(context: context,
                             initialDate: currentValue?? DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2100));
                         if(date != null){
                           final time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(currentValue??DateTime.now()));
                           return DateTimeField.combine(date, time);
                         }else{
                           return currentValue;
                         }

                       },
                       controller:endController,
                     )
            ],
                  )
                  // TextFormField(
                  //     cursorColor: Colors.black26,
                  //     decoration: InputDecoration(
                  //         hintText: "Filter by date Range",
                  //         border: InputBorder.none),
                  //         controller: dateController,
                  //    //  validator: (lonController)=>
                  //    //  lonController!= null && lonController.isEmpty?
                  //    //  "Enter Longitude"
                  //    //      :null
                  // ),
                ),
                InkWell(
                  onTap: () async{
                    String? date;
                     if(startController.text.toString().isEmpty){
                       date= "";
                     }else{
                       date =  startController.text.toString()+" - "+endController.text.toString();
                     }
                    Navigator.pop(context);
                    await filterValue(dropdownvalue,date);

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
                        child://loading ? CircularProgressIndicator(color:Colors.white):
                        Text("Filter",style: GoogleFonts.besley(fontSize: 18,color:Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, // light
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
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
                  // setState(() {
                  //   //query = value;
                  // });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color(0xfff3f1f1),
                  filled: true,
                  hintText: "Search by item name",
                  suffixIcon: IconButton(
                    onPressed: () => showChoiceDialog(context),
                    icon: Image.asset("assets/filter.png"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
             //loading?SizedBox(height:20,width:20,child:CircularProgressIndicator(color:Colors.green)):
            Expanded(
              child: loading? Center(child: CircularProgressIndicator(),):
                    orderModel == null? Center(child: Text("No data found !!")): ListView.builder(
                        itemCount: orderModel?.orders?.length,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            child: SingleItem(orderModel!.orders![index],index),
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SingleItemPreview(
                                orderModel!.orders![index].billingAddress,
                                orderModel!.orders![index].shippingAddress,
                                orderModel!.orders![index].orderDetails,
                                index))),
                          );
                        }
                    )

              )
       ],
    ),
      ),
    );
  }

}