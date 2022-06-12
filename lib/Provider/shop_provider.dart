import 'package:dio/dio.dart';
import 'package:ecommerce_app/Model/shop_model.dart';
import 'package:flutter/foundation.dart';

class ShopProvider extends ChangeNotifier{

  Shop? shopData ;
  String? _authToken;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
  }

  List<ShopAllProducts> allProductList = [];

  void update(String token) {
    _authToken = token;
    notifyListeners();
  }

  Future<void> getData ()async{
    setLoading(true);
    print("token"+_authToken.toString());
    try {
      final response = await Dio().post('https://hurrybuzz.com/api/v1/seller/shop',
        options: Options(
            headers: {
              "apiKey": "sdfdge544364dg#",
              "Authorization": "Bearer $_authToken"}),
      );
      Map<String,dynamic> dashboardDataList= response.data;

      if(response.statusCode == 200) {
        // _dashboardData.clear();
        shopData = Shop.fromJson(dashboardDataList);
        allProductList = ShopAllProducts.fromJsonList(dashboardDataList["all_products"]);

        print(shopData!.shopDetails!.address);
        print(allProductList);
        setLoading(false);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
