import 'dart:convert';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/Model/reportModel.dart';
import 'package:ecommerce_app/auth/screens/login_screen.dart';
import 'package:ecommerce_app/auth/widgets/text_field_container.dart';
import 'package:ecommerce_app/screen/report/productStock/reportDesign.dart';
import 'package:ecommerce_app/screen/report/productStock/reportHeadLine.dart';
import 'package:ecommerce_app/screen/report/report_headLine.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'report_design.dart';

class AllProductReport extends StatefulWidget {
  const AllProductReport({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AllProductReport> {

  bool _loading = true;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
  }

  ReportModel? reportModel;
  Future<void> initialize() async {
   // print("initializing=====");
    setLoading(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? authToken = pref.getString("token");
    print("token"+authToken.toString());
    final response = await http.post(Uri.parse('https://hurrybuzz.com/api/v1/seller/reports'),
      headers: {
        "apiKey": "sdfdge544364dg#",
        "Authorization": "Bearer $authToken"},
    );

    if(response.statusCode == 200){
      var data = jsonDecode(response.body.toString());
      reportModel = ReportModel.fromJson(data);
      setLoading(false);
      // return OrderModel.fromJson(data);
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

  Future<void> filterValue(String dateTime,String cat_id) async{
    setLoading(true);
    print("filter =====");
    print("category_id === $cat_id");
    print("dateTime === $dateTime");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? authToken = pref.getString("token");
    Response response = await Dio().post('https://hurrybuzz.com/api/v1/seller/reports/filter',
      options: Options(
        headers: {
          "apiKey": "sdfdge544364dg#","Authorization": "Bearer $authToken"},),
      data: {
        'dt': dateTime,
        'c': cat_id,
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
        reportModel = ReportModel.fromJson(response.data);
      });
      setLoading(false);
      // return OrderModel.fromJson(data);
    }
    //else{
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text("hhhhhhhhhh"),
    //   ));
    // }
    setLoading(false);
  }
  String dropdownvalue = 'Report Type';
  var items = [
    'Report Type',
    'Product Sale',
    'Product Stock',
  ];

  //List catData = [];
  List<dynamic>? catData;//edited line
  Future<void> getCategoryData() async {
    var res = await http
        .post(Uri.parse("https://hurrybuzz.com/api/v1/seller/categories"),
        headers: {"apiKey": "sdfdge544364dg#"});

    Map<String, dynamic> map = json.decode(res.body);


    setState(() {
      catData = map["categories"];
     // catData = resBody;
    });
    //return "Sucess";
  }

  // Future<ReportModel> initialize() async {
  //   setLoading(true);
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? authToken = pref.getString("token");
  //   print("token"+authToken.toString());
  //   final response = await http.post(Uri.parse('https://hurrybuzz.com/api/v1/seller/reports'),
  //     headers: {
  //       "apiKey": "sdfdge544364dg#",
  //       "Authorization": "Bearer $authToken"},
  //   );
  //   var data = jsonDecode(response.body.toString());
  //   if(response.statusCode == 200){
  //     return ReportModel.fromJson(data);
  //   }else{
  //     return ReportModel.fromJson(data);
  //   }
  // }

  @override
  void initState() {
    initialize();
    getCategoryData();
    setLoading(false);
    super.initState();
  }

  showChoiceDialog(BuildContext context) {
    final format = DateFormat('MM-dd-yyyy hh:mm:a');
    return showDialog(context: context,builder: (BuildContext context){
      TextEditingController startController = TextEditingController();
      TextEditingController endController = TextEditingController();
      var catSelection;
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
                    hint: Text("Report Type"),
                    underline: SizedBox(),
                    focusColor: Colors.black26,
                    value: dropdownvalue,
                    isExpanded: true,
                    iconSize: 36,
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    items: items.map((String item) {
                      return DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                    // validator: (dropdownvalue)=>
                    // dropdownvalue!= null && dropdownvalue == 0?
                    // "Select account type"
                    //     :null
                  ),

                ),
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 10),
                  // padding: EdgeInsets.symmetric(horizontal:12 ,vertical:4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color:Colors.black26,width: 1)
                  ),
                  //child: ShopTypeDropDown(shopSelection),
                  child: DropdownButton(
                    hint: Text("category"),
                    underline: SizedBox(),
                    focusColor: Colors.black26,
                    isExpanded: true,
                    iconSize: 36,
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    items: catData!.map((item) {
                      return DropdownMenuItem(
                        child: Text(item["cat_languages"][0]["title"]),
                        value: item["cat_languages"][0]["category_id"],
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        catSelection = newValue!;
                      });
                    },
                    // validator: (dropdownvalue)=>
                    // dropdownvalue!= null && dropdownvalue == 0?
                    // "Select account type"
                    //     :null
                    value: catSelection,
                  ),

                ),
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
                    await filterValue(date,catSelection);
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
        body:  Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
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
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Color(0xfff3f1f1),
                    filled: true,
                    hintText: "Filter item",

                    suffixIcon: IconButton(
                      onPressed: () => showChoiceDialog(context),
                      icon: Image.asset("assets/filter.png"),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Product sale",style: TextStyle(color:Colors.black,fontSize:20),),
              const SizedBox(
                height: 10,
              ),
              dropdownvalue.contains("Product Stock")?report_head_stock():report_head(),
              Expanded(
                child: loading? Center(child: CircularProgressIndicator(),) :
                   reportModel != null? ListView.builder(
                    itemCount: reportModel?.reports?.length,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        child: dropdownvalue.contains("Product Stock")? report_design_stock(reportModel!.reports![index]):report_design(reportModel!.reports![index]),
                        //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SingleItemPreview(orderModel!.orders![index],index))),
                      );
                    }
                ):Center(child: Text("No data found !!"))

              )
            ],
          ),
        ),


    );
  }
}