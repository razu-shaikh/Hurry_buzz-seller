import 'package:flutter/material.dart';

class report_head extends StatefulWidget {
  report_head({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<report_head> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 1,
          color: Colors.black45,
        ),
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
                  child: Text("Product name",style: TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight. bold
                  ),
                  ),
                ),
                VerticalDivider(
                  width: 10,
                  thickness: 1,
                  color: Colors.black26,
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(2),

                  ),
                  child: Text("Shop name",style: TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight. bold),),
                ),
                VerticalDivider(
                  width: 10,
                  thickness: 1,
                  color: Colors.black26,
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(2),

                  ),
                  child: Text("Varient",style: TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight. bold),),
                ),
                VerticalDivider(
                  width: 10,
                  thickness: 1,
                  color: Colors.black26,
                ),
                Container(
                  width: 70.0,
                  height: 50.0,
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(2),

                  ),
                  child: Text("Category",style: TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight. bold),),
                )
              ]
          ),
        ),
        Divider(
          height: 2,
          color: Colors.black45,
        )

      ],
    );
  }
}