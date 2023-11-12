import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:atoz/app/core/contsants/consts.dart';
import 'package:atoz/app/data/models/hotel/book_room_model.dart';
import 'package:atoz/app/data/models/hotel/hotel_model.dart';
import 'package:atoz/app/data/models/hotel/room_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HotelProvider {
  final GetStorage authBox = GetStorage();
  String _getHotelsEndPoint = '';
  String _getHotelDetailsEndPoint = '';
  String _getHotelRoomEndPoint = '';
  String _bookHotelRoomEndPoint = '';
  String? mainUrl = '';

  HotelProvider() {
    mainUrl = baseUrl;
    _getHotelsEndPoint = '${mainUrl!}/hotel/index';
    _getHotelDetailsEndPoint = '${mainUrl!}/hotel/';
    _getHotelRoomEndPoint = '${mainUrl!}/room/index';
    _bookHotelRoomEndPoint = '${mainUrl!}/room/book';
  }

  Future<List<HotelModel>?> getListHotel() async {
    try {
      log(_getHotelsEndPoint);
      log(authBox.read('userToken'));
      final response = await http.get(Uri.parse(_getHotelsEndPoint), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authBox.read('userToken')}',
      });

      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        final responseData = convert.jsonDecode(response.body);
        List<HotelModel> myModels;
        myModels = (responseData['hotel'] as List)
            .map((i) => HotelModel.fromJson(i))
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

  Future<HotelModel?> getHotelByIndex(int index) async {
    try {
      log(_getHotelDetailsEndPoint);
      final response = await http
          .get(Uri.parse("$_getHotelDetailsEndPoint$index"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authBox.read('userToken')}',
      });

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        final responseData = convert.jsonDecode(response.body);
        HotelModel hotelModel = HotelModel.fromJson(responseData);
        return hotelModel;
      } else {
        log("wrong");
      }
    } catch (error) {
      log(error.toString());
    }
    return null;
  }

/*

  Future<List<RoomModel>?> getListHotelRoom(int index) async {
    try {
      log(_getHotelRoomEndPoint);
      log(authBox.read('userToken'));
      final response = await http.get(Uri.parse(_getHotelRoomEndPoint), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authBox.read('userToken')}',
      });

      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        final responseData = convert.jsonDecode(response.body);
        List<RoomModel> myModels;
        myModels = (responseData['room'] as List)
            .map((i) => RoomModel.fromJson(i))
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
*/

  Future<List<RoomModel>?> getListHotelRoom(int index) async {
    try {
      log(_getHotelRoomEndPoint);
      log(authBox.read('userToken'));
      final request = http.Request(
        'GET',
        Uri.parse(_getHotelRoomEndPoint),
      )..headers.addAll({
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${authBox.read('userToken')}',
        });
      var params = {"HotelID": "$index"};
      request.body = jsonEncode(params);
      var response = await request.send();
      print(response.statusCode);
      print(response.stream);
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        var responseBody = await response.stream.bytesToString();
        print(responseBody);
        final responseData = convert.jsonDecode(responseBody);
        List<RoomModel> myModels;
        myModels = (responseData['room'] as List)
            .map((i) => RoomModel.fromJson(i))
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

  Future<bool> bookHotelRoom(int index, String data, String duration) async {
    try {
      log(_bookHotelRoomEndPoint);
      BookRoomModel bookRoomModel = BookRoomModel(
          roomId: index.toString(), date: data, duration: duration);

      log(jsonEncode(bookRoomModel.toJson()).toString());
      final response =
          await http.post(Uri.parse("$_bookHotelRoomEndPoint"),
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer ${authBox.read('userToken')}',
              },
              body: jsonEncode(bookRoomModel.toJson()));

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        Get.snackbar("Successfully", "Room has been booked",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);

        return true;
      } else {
        Get.snackbar("Error", "",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        log("wrong");
      }
    } catch (error) {
      log(error.toString());
    }
    return false;
  }
}
