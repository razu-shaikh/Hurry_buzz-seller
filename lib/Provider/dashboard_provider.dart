import 'package:dio/dio.dart';
import 'package:ecommerce_app/Model/dashboard_model.dart';
import 'package:flutter/foundation.dart';

class DashboardProvider extends ChangeNotifier{
  Dashboard? dashboardData ;
  //DashboardOrderState? stateData ;
   String? _authToken;

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
        // stateData = DashboardOrderState.fromJson(dashboardDataList);
         //print(stateData);
          print("bbbbbbb"+dashboardData!.user!.phone.toString());
         // print(dashboardDataList['user']['phone']);
        // return dashboardData ;
      }
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  }
