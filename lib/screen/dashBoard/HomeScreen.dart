import 'package:ecommerce_app/Provider/dashboard_provider.dart';
import 'package:ecommerce_app/screen/dashBoard/dot_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'line_chart.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
  }

  List<Choice> choices =  <Choice>[];
  List<Choice> choices2 =  <Choice>[];

  Future<void> initialize() async {
    // final token =  Provider.of<AuthProvider>(context,listen: false).token;
    // print("init token============");
    final provider =  Provider.of<DashboardProvider>(context,listen: false);
    await provider.getData();

    final data = provider.dashboardData;

    choices =  <Choice>[
      Choice(title: 'Order',value:data!.totalOrders.toString(),icon: "assets/order.png"),
      Choice(title: 'Sales',value:data.totalSales.toString(), icon: "assets/sales.png"),
      Choice(title: 'Product',value:data.totalProducts.toString(), icon: "assets/product.png"),
      Choice(title: 'campaign',value:data.totalCampaign.toString(), icon: "assets/campaign.png"),
    ];
    choices2 =  <Choice>[
      Choice(title: 'Pending',value:data.pendingOrders.toString(), icon: "assets/pending.png"),
      Choice(title: 'Processing',value:data.processingOrders.toString(), icon: "assets/process.png"),
      Choice(title: 'Delivered',value:data.deliveredOrders.toString(), icon: "assets/delivery.png"),
    ];

    setState(() {
      setLoading(false);
    });
  }

  @override
  void initState() {
    setLoading(true);
    initialize();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color(0xFFF8F8F8),
            body:RefreshIndicator(
              onRefresh: initialize,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: GridView.count(
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
                  ),
                  Container(
                    height: 10.0,
                  ),
                  Center(
                      child:loading?CircularProgressIndicator(color:Colors.green):
                      Text("")
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18, bottom: 10),
                    child:Text('Order Statistic',
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: GridView.count(
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
                  ),

                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text('Order State',
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
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
                      style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    width: 360,
                    height: 250,
                    child: Padding(padding: const EdgeInsets.only(right: 10),
                      child: DotCharts(),) ,
                  ),

                ],
              ),
            )
        )
    );
  }
}

class Choice {
  const Choice({required this.title,required this.value,required this.icon});
  final String title;
  final String value;
  final String icon;
}


class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {

    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(width: 1, color: Color(0xFFD4D4D4))),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, top: 20),
                  child: Text(choice.title,textAlign: TextAlign.left,),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Text(choice.value,textAlign: TextAlign.left,),
                )
              ],

            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0,),
              child: Image.asset(choice.icon, color: Colors.black54, height: 25,width: 25,),
            ),

          ],
        )
    );
  }
}
class SelectCard2 extends StatelessWidget {
  const SelectCard2({Key? key, required this.choice2 }) : super(key: key);
  final Choice choice2;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(width: 1, color: Color(0xFFD4D4D4))),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, top: 20),
                  child: Text(choice2.title,textAlign: TextAlign.left,),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Text(choice2.value,textAlign: TextAlign.left,),
                )
              ],

            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0,),
              child: Image.asset(choice2.icon, color: Colors.black54, height: 25,width: 25,),
            ),

          ],
        )
    );
  }
}