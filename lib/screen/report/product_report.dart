import 'package:ecommerce_app/config/colors.dart';
import 'package:ecommerce_app/screen/report/report_headLine.dart';
import 'package:flutter/material.dart';

import 'report_design.dart';

class AllProductReport extends StatefulWidget {
  const AllProductReport({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AllProductReport> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    fillColor: Color(0xffc2c2c2),
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
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) =>
                      report_design(),
                )
              ),
            ],
          ),
        ),


    );
  }
}