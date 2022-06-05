import 'package:ecommerce_app/screen/dashBoard/dot_chart.dart';
import 'package:flutter/material.dart';
import 'line_chart.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            // appBar: AppBar(
            //   title: Text("Demo Shop"),
            //   //automaticallyImplyLeading: false,
            //   backgroundColor: Colors.red,
            // ),
            // drawer: Drawer(
            //   child:DrawerSide(),
            // ),
            body:ListView(
              children: [
                GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                  childAspectRatio: 3/2,
                    shrinkWrap: true,
                    children: List.generate(choices.length, (index) {
                      return Center(
                        child: SelectCard(choice: choices[index], key: null,),
                      );
                    }).toList(),
                ),
                Container(
                  height: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('Order Statistic',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 3/2,
                  shrinkWrap: true,
                  children: List.generate(choices2.length, (index) {
                    return Center(
                      child: SelectCard2(choice2: choices2[index], key: null,),
                    );
                  }).toList(),
                ),

                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('Order State',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
                Container(
                  width: 360,
                  height: 250,
                  child: Padding(padding: const EdgeInsets.only(right: 10),
                  child: LineCharts(),),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('Sales State',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
                Container(
                  width: 360,
                  height: 250,
                  child: DotCharts() ,
                ),

              ],
            )
        )
    );
  }
}

class Choice {
  const Choice({required this.title, required this.icon});
  final String title;
  final String icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Order', icon: "assets/order.png"),
  const Choice(title: 'Sales', icon: "assets/sales.png"),
  const Choice(title: 'Product', icon: "assets/product.png"),
  const Choice(title: 'campaign', icon: "assets/campaign.png"),
];
const List<Choice> choices2 = const <Choice>[
  const Choice(title: 'Pending', icon: "assets/pending.png"),
  const Choice(title: 'Processing', icon: "assets/process.png"),
  const Choice(title: 'Delivered', icon: "assets/delivery.png"),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        color: Colors.white70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(choice.title,textAlign: TextAlign.left,),
                Text("200",textAlign: TextAlign.left,)
              ],

            ),
            Container(
              margin: EdgeInsets.only(left: 10,top:30),
              height: 25,
              width: 25,
              child: Image.asset(choice.icon, color: Colors.black54),
            ),

          ],
        )
    );
  }
}
class SelectCard2 extends StatelessWidget {
  const SelectCard2({Key? key, required this.choice2}) : super(key: key);
  final Choice choice2;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        color: Colors.white70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(choice2.title,textAlign: TextAlign.left,),
                Text("200",textAlign: TextAlign.left,)
              ],

            ),
            Container(
              margin: EdgeInsets.only(left: 10,top:30),
              height: 25,
              width: 25,
              child: Image.asset(choice2.icon, color: Colors.black54),
            ),

          ],
        )
    );
  }
}