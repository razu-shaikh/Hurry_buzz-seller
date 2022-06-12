import 'package:ecommerce_app/Provider/shop_provider.dart';
import 'package:ecommerce_app/screen/shop/allProduct/single_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProductList extends StatefulWidget {
  const AllProductList({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<AllProductList> {

  @override
  Widget build(BuildContext context) {
    final shopProvider = Provider.of<ShopProvider>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
            children: [
              shopProvider.loading?SizedBox(height:20,width:20,child:CircularProgressIndicator(color:Colors.green)):
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(3),
                    itemCount: shopProvider.allProductList.length,
                    itemBuilder: (context, index){
                      return SingalProduct(shopProvider.allProductList[index]);
                    }

              ),
              )
            ],
          ),
        )
    );
  }
}