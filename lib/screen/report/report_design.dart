import 'package:flutter/material.dart';

class report_design extends StatefulWidget {
  report_design({Key? key}) : super(key: key);
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
                  child: Text("React.js",style: TextStyle(color:Colors.black,fontSize:15),),
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
                  child: Text("MySQL",style: TextStyle(color:Colors.black,fontSize:15),),
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
                  child: Text("MySQL",style: TextStyle(color:Colors.black,fontSize:15),),
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