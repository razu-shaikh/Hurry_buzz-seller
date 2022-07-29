import 'package:ecommerce_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_app/Model/OrderModel.dart';
import '../notification/notification.dart';

class SingleItemPreview extends StatefulWidget {
  BillingAddress? billingAddress;
  ShippingAddress? shippingAddress;
  List<OrderDetails>? orderDetails;
  int index;
  SingleItemPreview(this.billingAddress,this.shippingAddress,this.orderDetails,this.index);



   // final Order? orders;
   // final int index;
   // SingleItemPreview( this.orders, this.index);

  @override
  _SingleItemState createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItemPreview> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loading = true;
  bool get loading => _loading;

  setLoading(bool value){
    setState(() {
      _loading = value;
    });
  }

  //OrderDetailsModel? orderDetailsModel;

  // Future<void> initialize() async {
  //   print("initializing=====");
  //   setLoading(true);
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? authToken = pref.getString("token");
  //   print("token"+authToken.toString());
  //   final response = await http.post(Uri.parse('https://hurrybuzz.com/api/v1/seller/orders/view/'+widget.id.toString()),
  //     headers: {
  //       "apiKey": "sdfdge544364dg#",
  //       "Authorization": "Bearer $authToken"},
  //   );
  //
  //   if(response.statusCode == 200){
  //     var data = jsonDecode(response.body.toString());
  //     orderDetailsModel = OrderDetailsModel.fromJson(data);
  //     // return OrderModel.fromJson(data);
  //   }
  //
  //   setLoading(false);
  // }

  @override
  void initState() {
   // initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // widget.isBool == false ?
    // widget.productUnit.productUnit.firstWhere((element) {
    //   setState(() {
    //     firstValue = element;
    //   });
    //   return true;
    // }):

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: Colors.red,
        title:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                 (loading && widget.orderDetails== null) ?Text("Order Id #"):Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order Id #"+widget.orderDetails![0].productId.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),

                  ],
                )

              ],
            )

          ],
        ) ,
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundColor:Colors.red,
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => notification()));
              },
              icon:Image.asset("assets/notification.png",width: 25,height: 25,color: Colors.white,),
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     scaffoldKey.currentState?.openDrawer();
          //   },
          //   child: Container(
          //     padding: EdgeInsets.all(8), // Border width
          //     decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(20),
          //       child: SizedBox.fromSize(
          //         size: Size.fromRadius(20), // Image radius
          //         child: Image.network('https://media.gettyimages.com/photos/healthy-fresh-organic-vegetables-in-a-crate-isolated-on-white-picture-id1247073860?s=612x612', fit: BoxFit.cover),
          //       ),
          //     ),
          //   ),
          // ),

        ],
      ),
      // key: scaffoldKey,
      // drawer: Drawer(
      //   child:DrawerSide(),
      // ),
      body:(loading && widget.orderDetails == null) ? Center(child: CircularProgressIndicator(),) : Column(
        children: [
          SizedBox(height: 10),
          Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: widget.orderDetails![0].product!.images!.isNotEmpty? NetworkImage(
                    'https://hurrybuzz.com/public/'+widget.orderDetails![0].product!.images![0].originalImage.toString()
                ):NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi0Xg-k622Sbztlrb-L1o1CAla3zCbVc2lUw&usqp=CAU'),
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          SizedBox(height: 10),
          Text('Order Details #'+widget.orderDetails![0].orderId.toString(),
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child:Container(
              margin: EdgeInsets.only(right: 5,left: 5,top:2,bottom:2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.orderDetails![0].product!.productName.toString(),
                                  style: TextStyle(
                                      color: textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(widget.orderDetails![0].orderId.toString(),
                                      style: TextStyle(
                                          color: textColor, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "10",
                                      style: TextStyle(
                                          color: textColor, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "min ago",
                                      style: TextStyle(
                                          color: textColor, fontWeight: FontWeight.normal),
                                    ),

                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text("\$"+widget.orderDetails![0].price.toString(),
                                      style: TextStyle(
                                          color: textColor, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "(1 pics)",
                                      style: TextStyle(
                                          color: textColor, fontWeight: FontWeight.normal),
                                    ),

                                  ],
                                )

                              ],
                            ),

                          ],
                        ),
                      )
                  ),

                ],
              ),
            ),

          ),
          Column(
            children: [
              Container(
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                  child: Text(
                    "Billing:",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ),

              ),
              Container(
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                  child: Text(
                    widget.billingAddress!.name.toString(),
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                ),

              ),

              Container(
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                  child: Text(
                    widget.billingAddress!.phoneNo.toString(),
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                ),

              ),
              Container(
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                  child: Text(
                    widget.billingAddress!.address.toString(),
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                ),

              ),
            ],
          ),
          Column(
            children: [
              Container(
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                  child: Text(
                    "Shipping:",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ),

              ),
              Container(
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                  child: Text(
                    widget.shippingAddress!.name.toString(),
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                ),

              ),

              Container(
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                  child: Text(
                    widget.shippingAddress!.phoneNo.toString(),
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                ),

              ),
              Container(
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                  child: Text(
                    widget.shippingAddress!.address.toString(),
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                ),

              ),
            ],
          )
        ],
      ),
    );
  }
}