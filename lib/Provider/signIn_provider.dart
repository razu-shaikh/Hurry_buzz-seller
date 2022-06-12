import 'package:dio/dio.dart';
import 'package:ecommerce_app/Model/registration_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class SignInProvider extends ChangeNotifier{
  Registration? registrationData;

  String? _token;
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  Future<void> signUp(String email, String password,String firstName,String lastName,String phone,String shopName,String address) async{
    print(email+password);
    setLoading(true);
    try{
      final response = await Dio().post('https://hurrybuzz.com/api/v1/seller/register',
        options: Options(
          headers: {"apiKey": "sdfdge544364dg#"},
        ),
        data: {
          "email": email,
          "password": password,
          "first_name":firstName,
          "last_name":lastName,
          "phone":phone,
          "shop_name":shopName,
          "address":address
        },
      );
      Map<String,dynamic> authDataList= response.data;
      if(response.statusCode == 200){
        registrationData = Registration.fromJson(authDataList);
        _token = registrationData!.data!.token;
         print(_token);

        setLoading(false);
      }
    }
    catch(e){
      print(e.toString);
      setLoading(false);

    }

  }
  String? get token {
    return _token;
  }

}