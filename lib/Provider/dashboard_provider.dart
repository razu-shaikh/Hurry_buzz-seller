import 'package:dio/dio.dart';
import 'package:ecommerce_app/Model/dashboard_model.dart';
import 'package:flutter/foundation.dart';

class DashboardProvider extends ChangeNotifier{
  Dashboard? dashboardData ;
    String? _authToken;
  List<DashboardOrderState?>orderState = [];
    List<int> orderStateList = [];
  List<DashboardSalesState?>sallerState = [];
  List<double> sallerStateList = [];

   void update(String token) {
     _authToken = token;
     notifyListeners();
   }

  Future<void> getData ()async{
    print("getData token"+_authToken.toString());
    try {
      final response = await Dio().post('https://hurrybuzz.com/api/v1/seller/dashboard',
        options: Options(
          headers: {
            "apiKey": "sdfdge544364dg#",
            "Authorization": "Bearer $_authToken"}),
      );
      Map<String,dynamic> dashboardDataList= response.data;
      if(response.statusCode == 200){
        // _dashboardData.clear();
         dashboardData = Dashboard.fromJson(dashboardDataList);
         orderState = dashboardData!.orderState!;
         orderStateList.clear();
         for (var i=0; i<orderState.length; i++) {
           orderStateList.add(dashboardData!.orderState![i]!.order!.toInt());
         }
         sallerStateList.clear();
         sallerState = dashboardData!.salesState!;
         for (var i=0; i<sallerState.length; i++) {
           sallerStateList.add(dashboardData!.salesState![i]!.sales!.toDouble());
         }
        // print(orderStateList);
         print(sallerStateList);

      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  }
