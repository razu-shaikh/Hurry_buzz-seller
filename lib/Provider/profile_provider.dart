import 'package:dio/dio.dart';
import 'package:ecommerce_app/Model/profile_model.dart';
import 'package:flutter/foundation.dart';

class ProfileProvider extends ChangeNotifier{

  Profile? profileData ;
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

  Future<void> getData ()async{
    setLoading(true);
    print("token"+_authToken.toString());
    try {
      final response = await Dio().post('https://hurrybuzz.com/api/v1/seller/me',
        options: Options(
            headers: {
              "apiKey": "sdfdge544364dg#",
              "Authorization": "Bearer $_authToken"}),
      );
      Map<String,dynamic> profileDataList= response.data;

      if(response.statusCode == 200) {
        // _dashboardData.clear();
        profileData = Profile.fromJson(profileDataList);
        setLoading(false);
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
