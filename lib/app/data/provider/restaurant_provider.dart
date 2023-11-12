import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:atoz/app/core/contsants/consts.dart';
import 'package:atoz/app/data/models/restaurant_model.dart';
import 'package:atoz/app/data/models/resturant/book_table_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RestaurantProvider {
  final GetStorage authBox = GetStorage();
  String _getRestaurantsEndPoint = '';
  String _getRestaurantDetailsEndPoint = '';
  String _bookTableEndPoint = '';
  String? mainUrl = '';

  RestaurantProvider() {
    mainUrl = baseUrl;
    _getRestaurantsEndPoint = '${mainUrl!}/restaurant/index';
    _getRestaurantDetailsEndPoint = '${mainUrl!}/restaurant/';
    _bookTableEndPoint = '${mainUrl!}/table/book';
  }

  Future<List<RestaurantModel>?> getListRestaurant() async {
    try {
      log(_getRestaurantsEndPoint);
      log(authBox.read('userToken'));
      final response =
          await http.get(Uri.parse(_getRestaurantsEndPoint), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authBox.read('userToken')}',
      });

      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        final responseData = convert.jsonDecode(response.body);
        List<RestaurantModel> myModels;
        myModels = (responseData['restaurant'] as List)
            .map((i) => RestaurantModel.fromJson(i))
            .toList();
        return myModels;
      } else {
        log("wrong");
      }
    } catch (error) {
      log(error.toString());
    }
    return null;
  }

  Future<RestaurantModel?> getRestaurantByIndex(int index) async {
    try {
      log(_getRestaurantDetailsEndPoint);
      final response =
          await http.get(Uri.parse("$_getRestaurantDetailsEndPoint$index"));

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        final responseData = convert.jsonDecode(response.body);
        RestaurantModel restaurantModel =
            RestaurantModel.fromJson(responseData);
        return restaurantModel;
      } else {
        log("wrong");
      }
    } catch (error) {
      log(error.toString());
    }
    return null;
  }

  Future<bool> bookTableRestaurant(String date, int id, int minutes) async {
    try {
      BookTableModel bookTableModel = BookTableModel(
          tableId: id.toString(), date: date, time: minutes.toString());

      log(_bookTableEndPoint);
      log(authBox.read('userToken'));
      final response = await http.post(Uri.parse(_bookTableEndPoint),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${authBox.read('userToken')}',
          },
          body: jsonEncode(bookTableModel.toJson()));
      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode <= 300) {

        Get.snackbar("Successfully", "Table has been booked",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);

        return true;
      } else {

        Get.snackbar("خطأ", "حدث خطأ",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white);
        log("wrong");
        return false;
      }
    } catch (error) {
      log(error.toString());
    }
    return false;
  }
}
