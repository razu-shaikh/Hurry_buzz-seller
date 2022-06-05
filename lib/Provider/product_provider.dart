import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/Model/product_model.dart';
import 'package:flutter/foundation.dart';

class ProductProvider extends ChangeNotifier{
  List<Product> _productList = [] ;

  get http => null;
  Future<List<Product>?> getProduct ()async{
    try {
      final response = await Dio().get('https://hurrybuzz.com/api/v1/seller/get-products',
        options: Options(
        headers: {
          "apiKey": "sdfdge544364dg#"},),
      );
      Map<String, dynamic> productData= response.data;

      if(response.statusCode == 200){
        _productList.clear();
          _productList = Product.fromJsonList(productData['data']);

          notifyListeners();

          return _productList ;
        }else {
          return _productList ;
        }
    } catch (e) {
      print(e);
    }
  }
  List<Product> get productList {
    return [..._productList];

  }

  // void getProduct ()async{
  //   try{
  //
  //     final resposne = await get(Uri.parse('https://hurrybuzz.com/api/v1/seller/get-products'),
  //         headers: {"apiKey": "sdfdge544364dg#"}) ;
  //     if(resposne.statusCode == 200){
  //       var data = jsonDecode(resposne.body);
  //       print(data.toString());
  //       // token = data['data']['token'];
  //       // email_user = data['data']['user']['email'];
  //
  //     }else{
  //       print("Fail");
  //     }
  //   }catch(e){
  //     print(e.toString());
  //   }
  //
  //
  // }
}