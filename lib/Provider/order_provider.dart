import 'package:dio/dio.dart';
import 'package:ecommerce_app/Model/order_model.dart';
import 'package:flutter/foundation.dart';

class OrderProvider extends ChangeNotifier{

  List<Order> orderList = [];
  String? _authToken;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
  }

  void update(String token) {
    _authToken = token;
    notifyListeners();
  }
  Future<void> getProduct ()async{
    setLoading(true);
    print("token"+_authToken.toString());
    try {
      final response = await Dio().post('https://hurrybuzz.com/api/v1/seller/orders',
        options: Options(
            headers: {
              "apiKey": "sdfdge544364dg#",
              "Authorization": "Bearer $_authToken"}),
      );
      Map<String,dynamic> ordersDataList= response.data;
      if(response.statusCode == 200){
        // _dashboardData.clear();
        orderList = Order.fromJsonList(ordersDataList['orders']);
        print("=========================");
        setLoading(false);
      }
    } catch (e) {
      print(e);
    }
  }


}