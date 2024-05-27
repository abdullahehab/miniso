import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:miniso/utills/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail()async{
    try{
      var headers = {'content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.loginEmail
      );

      Map body = {
        'email' :emailController.text.trim(),
        'password' :passwordController.text,
      };

      http.Response response=
      await http.post(url,body: jsonEncode(body),headers: headers);
      if (response.statusCode ==200){
        final json = jsonDecode(response.body);
        var token = json['Token'];
        print(token);
        final SharedPreferences? prefs =await _prefs;
        await prefs?.setString('token', token);
        emailController.clear();
        passwordController.clear();
      }else{
        throw jsonDecode(response.body)['message'] ?? 'Unknown Error Occured';
      }

    }catch (e){
      Get.back();
      showDialog(context: Get.context!, builder: (context){
        return SimpleDialog(
          title: Text('Error'),
          contentPadding: EdgeInsets.all(20),
          children: [
            Text(e.toString(),),
          ],
        );
      }
      );
    }
  }
}