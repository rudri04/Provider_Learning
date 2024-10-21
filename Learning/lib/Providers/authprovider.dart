import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {

  bool _isloading = false;
  bool get isloading => _isloading;


  void setLoading(bool value){
    _isloading = value;
    notifyListeners();
  }


  void Login(String email,String password) async {
    String url = 'https://reqres.in/api/login';
    setLoading(true);
    try{
      final response = await http.post(
          Uri.parse(url),
          body: {
            'email' : email,
            'password' : password
          }
      );

      if(response.statusCode == 200){
        Get.snackbar('Login','Login Successfully!!!');
        print('SuccessFull Login!!');
        setLoading(false);
      }
      else{
        Get.snackbar('Alert','Login Failed!!!');
        print('Login Failed');
        setLoading(false);
      }


    }catch(e){
      print('Exception>>>>>>$e');
    }

  }

}