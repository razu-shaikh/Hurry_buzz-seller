import 'package:ecommerce_app/Model/reportModel.dart';
import 'package:flutter/material.dart';

class report_design extends StatefulWidget {
  Reports reportModelReports;
  report_design(this.reportModelReports, {Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<report_design> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
                Container(
                  width: 60.0,
                  height: 50.0,
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(2),

                  ),
                  child: Text(widget.reportModelReports.productName.toString(),style: TextStyle(color:Colors.black,fontSize:15),),
                ),
                VerticalDivider(
                  width: 10,
                  thickness: 2,
                  color: Colors.black12,
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(2),

                  ),
                  child: Text("Flutter",style: TextStyle(color:Colors.black,fontSize:15),),
                ),
                VerticalDivider(
                  width: 10,
                  thickness: 2,
                  color: Colors.black12,
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(2),

                  ),
                  child: Text(widget.reportModelReports.hasVariant.toString(),style: TextStyle(color:Colors.black,fontSize:15),),
                ),
                VerticalDivider(
                  width: 10,
                  thickness: 2,
                  color: Colors.black12,
                ),
                Container(
                  width: 70.0,
                  height: 50.0,
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(2),

                  ),
                  child: Text(widget.reportModelReports.category!.title.toString(),style: TextStyle(color:Colors.black,fontSize:15),),
                )
              ]
          ),
        ),
        Divider(
          height: 2,
          color: Colors.black12,
        )

      ],
    );
  }
}