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
  Future<void> signUp(
      String email,
      String password,
      String firstName,
      String lastName,
      String accountType,
      String phone,
      String shopName,
      String slug,    //shop user name
      String address,
      String latitude,
      String longitude,
      String shop_type_id,
      String state_id,
      String city_id,
      String town_id,
      String logo,
      String banner
      ) async{
    print(email+password+firstName+lastName+accountType+phone+shopName+slug+address+latitude+longitude+shop_type_id+state_id+city_id+town_id);
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
          "account_type":accountType,
          "phone":phone,
          "shop_name":shopName,
          "slug":slug,
          "address":address,
          "latitude":latitude,
          "longitude":longitude,
          "shop_type_id":shop_type_id, //must be a number
          "state_id":state_id,//must be a number
          "city_id":city_id,//must be a number
          "town_id":town_id,//must be a number
          "logo":logo,
          "banner":banner
        },
      );
      Map<String,dynamic> authDataList= response.data;
      print(response);
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