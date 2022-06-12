import 'package:ecommerce_app/Provider/shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../config/colors.dart';
import 'allProduct/tab_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? shopName;
  String? shopType;

  Future<void> initialize() async {
    final shopProvider = Provider.of<ShopProvider>(context,listen: false);
    await shopProvider.getData();
    final data = shopProvider.shopData;

    setState(() {
      shopName = data!.shopDetails!.shopName;
      shopType = data.shopType;
    });
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi0Xg-k622Sbztlrb-L1o1CAla3zCbVc2lUw&usqp=CAU'),
                ),
                color: Colors.red,
                borderRadius: BorderRadius.only(bottomRight:Radius.circular(10),bottomLeft: Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40,right: 220),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color(0xffd1ad17),
                                borderRadius: BorderRadius.circular(5),
                              ),
                                child:Container (
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://media.gettyimages.com/photos/healthy-fresh-organic-vegetables-in-a-crate-isolated-on-white-picture-id1247073860?s=612x612'),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      height: 30,
                      width: 30,
                      margin: EdgeInsets.only(right: 10,bottom: 60),
                      decoration: BoxDecoration(
                          color: Color(0xffc2c6c2),
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(Icons.edit)
                  ),
                ],
              ),
            ),
          SizedBox( // <-- use a sized box and change the height
             height: 45.0,
          child:Padding(
            padding: const EdgeInsets.only(left: 16,top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(shopName.toString(), textAlign: TextAlign.left, style: TextStyle(fontSize: 18)),
                      Text(shopType.toString(), textAlign: TextAlign.left, style: TextStyle(fontSize: 13)),
                   ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                      },
                      icon: ImageIcon( AssetImage("assets/earth.png"),
                        size: 23,),
                    ),
                    IconButton(
                      onPressed: () {
                      },
                      icon: Icon(
                        Icons.share,
                        size: 20,
                        color: textColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          ),
          SizedBox( // <-- use a sized box and change the height
             height: 30.0,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                    },
                    icon: Icon(
                      Icons.star,
                      size: 20,
                      color: textColor,
                    ),
                  ),
                  Text('5.0', textAlign: TextAlign.left, style: TextStyle(fontSize: 18)),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('(By 2000 people)', textAlign: TextAlign.left, style: TextStyle(fontSize: 13)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom:10),
                    child: IconButton(
                      onPressed: () {
                      },
                      icon: Icon(
                        Icons.shop_outlined,
                        size: 20,
                        color: textColor,
                      ),
                      ),
                  ),
                  Text('122', textAlign: TextAlign.left, style: TextStyle(fontSize: 18)),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          ),
          ),
          TabBar_shop(),
          ],
        ),
    );
  }
}