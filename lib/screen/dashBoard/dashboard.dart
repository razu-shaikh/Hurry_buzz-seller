import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'dot_chart.dart';
import 'line_chart.dart';


List<StaggeredTile>  _cardTile = <StaggeredTile> [
  StaggeredTile.extent(1,150),
  StaggeredTile.extent(1, 150),
  StaggeredTile.extent(1, 150),
  StaggeredTile.extent(1, 150),
  StaggeredTile.extent(15,15),
  StaggeredTile.extent(1, 150),
  StaggeredTile.extent(1, 150),
  StaggeredTile.extent(1, 150),
  StaggeredTile.extent(15,15),
  StaggeredTile.extent(2, 250),
  StaggeredTile.extent(15,15),
  StaggeredTile.extent(2, 250)
];

//List of Cards with color and icon
List<Widget>_listTile = <Widget>[
  BackGroundTile(backgroundColor: Colors.white, icondata: Icons.assignment_outlined,name: "Order",quantity: "200",),
  BackGroundTile(backgroundColor: Colors.white, icondata: Icons.sell,name: "sales",quantity: "200",),
  BackGroundTile(backgroundColor: Colors.white, icondata: Icons.shopping_cart_outlined,name: "product",quantity: "200",),
  BackGroundTile(backgroundColor: Colors.white, icondata: Icons.campaign,name: "Campaign",quantity: "200",),
  Text("order statics"),
  BackGroundTile(backgroundColor: Colors.white, icondata: Icons.pending,name: "pending",quantity: "200",),
  BackGroundTile(backgroundColor: Colors.white, icondata: Icons.assignment,name: "processing",quantity: "200",),
  BackGroundTile(backgroundColor: Colors.white, icondata: Icons.airport_shuttle,name: "Delivered",quantity: "200",),
  Text("order state"),
  LineCharts(),
  Text("sales state"),
  DotCharts()
];

class  HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Shop"),
      ),
      body: Container(
           alignment: Alignment.center,
        // Staggered Grid View starts here
        child: StaggeredGridView.count(
          crossAxisCount: 2,
          staggeredTiles: _cardTile,
          children: _listTile,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal:16.0 ,vertical: 8.0),

        ),
      ),
    );
  }
}
class BackGroundTile extends StatelessWidget {
  final Color backgroundColor;
  final IconData icondata;
  final String name;
  final String quantity;

  BackGroundTile({required this.backgroundColor, required this.icondata,required this.name,required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: backgroundColor,
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icondata, color: Colors.black54),
              Text(name,textAlign: TextAlign.left,),
              Text(quantity,textAlign: TextAlign.left,)
            ],
          )
      );
  }
}