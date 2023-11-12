import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:atoz/app/core/contsants/consts.dart';
import 'package:atoz/app/data/models/auth/login_model.dart';
import 'package:atoz/app/data/models/auth/signup_model.dart';
import 'package:atoz/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AuthProvider {
  final GetStorage authBox = GetStorage();
  String _logInEndPoint = '';
  String _signUpEndPoint = '';
  String? mainUrl = '';

  AuthProvider() {
    mainUrl = baseUrl;
    _logInEndPoint = '${mainUrl!}/login';
    _signUpEndPoint = '${mainUrl!}/signup';
  }

  Future<bool> logIn(LoginModel model) async {
    try {
      log(_logInEndPoint);
      log(model.toJson().toString());
      final response = await http.post(Uri.parse(_logInEndPoint),
          body: jsonEncode(model.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },);
      print(response.statusCode.toString());
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        Get.snackbar("Successfully", "",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        final responseData = convert.jsonDecode(response.body);
        print(responseData.toString());
        print(responseData['token']);
        authBox.write('userToken', responseData['token']);
        authBox.write('userEmail', model.email.toString());
        log("done writing");
        return true;
      } else {
        Get.snackbar("error", convert.jsonDecode(response.body)["msg"]??"error",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white);
        // log(convert.jsonDecode(response.body));
        log("wrong");
      }
    } on SocketException catch (e) {
      Get.snackbar("خطأ", "time out",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    } catch (error) {
      log(error.toString());
      Get.snackbar("خطأ", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }
    return false;
  }

  Future<bool> signUp(SignupModel model) async {
    try {
      log(_signUpEndPoint);
      log(model.toJson().toString());
      log("dffddffd");
      final response = await http.post(
        Uri.parse(_signUpEndPoint),
        body: jsonEncode(model.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      log("dffddffd");
      print(response.statusCode.toString());
      print(response.body.toString());

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        Get.snackbar("Successfully", "",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        final responseData = convert.jsonDecode(response.body);
        print(responseData.toString());
        print(responseData['token']);
        authBox.write('userToken', responseData['token']);
        authBox.write('userEmail', model.user?.email.toString());
        log("done writing");
        return true;
      } else {
        Get.snackbar("error", convert.jsonDecode(response.body)["msg"]??"error",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white);
        log(convert.jsonDecode(response.body));
        log("wrong");
      }
    } on SocketException catch (e) {
      Get.snackbar("خطأ", "time out",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    } catch (error) {
      log(error.toString());
      Get.snackbar("خطأ", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }
    return false;
  }

  bool logOut() {
    authBox.remove('userToken');
    authBox.remove('userEmail');
    Get.offAllNamed(Routes.SIGN_IN);
    return true;
  }
}
