import 'dart:convert';
import 'package:ecommerce_app/Model/reportModel.dart';
import 'package:ecommerce_app/screen/report/report_headLine.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'report_design.dart';

class AllProductReport extends StatefulWidget {
  const AllProductReport({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AllProductReport> {

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
  }

  Future<ReportModel> initialize() async {
    setLoading(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? authToken = pref.getString("token");
    print("token"+authToken.toString());
    final response = await http.post(Uri.parse('https://hurrybuzz.com/api/v1/seller/reports'),
      headers: {
        "apiKey": "sdfdge544364dg#",
        "Authorization": "Bearer $authToken"},
    );
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      return ReportModel.fromJson(data);
    }else{
      return ReportModel.fromJson(data);
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
                    hintText: "Search for items in the store",
                    suffixIcon: Icon(Icons.filter_list_sharp),
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
              report_head(),
              Expanded(
                  child: FutureBuilder<ReportModel>(
                      future: initialize(),
                      builder: (context,snapShot){
                        if(snapShot.hasData){
                          return ListView.builder(
                              itemCount: snapShot.data!.reports!.length,
                              itemBuilder: (context, index){
                                return GestureDetector(
                                  child: report_design(snapShot.data!.reports![index]),
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