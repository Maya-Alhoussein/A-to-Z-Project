import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:atoz/app/core/contsants/consts.dart';
import 'package:atoz/app/data/models/location/company_model.dart';
import 'package:atoz/app/data/models/trip/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/trip/trip_model.dart';

class FlightProvider {
  final GetStorage authBox = GetStorage();
  String _getFlightCompanyEndPoint = '';
  String _getFlightTripsEndPoint = '';
  String? mainUrl = '';

  FlightProvider() {
    mainUrl = baseUrl;
    _getFlightCompanyEndPoint = '${mainUrl!}/trip/companies';
    _getFlightTripsEndPoint = '${mainUrl!}/trip/index';
  }


  Future<List<CompanyModel>?> getListCompany() async {
    try {
      log(_getFlightCompanyEndPoint);
      log(authBox.read('userToken'));
      final response =
      await http.get(Uri.parse(_getFlightCompanyEndPoint), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
        'Bearer ${authBox.read('userToken')}',
      });
      print(response.body);
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        final responseData = convert.jsonDecode(response.body);
        List<CompanyModel> myModels;
        myModels = (responseData['company'] as List)
            .map((i) => CompanyModel.fromJson(i))
            .toList();
        return myModels;
      } else {
        log("wrong");
      }
    }  catch (error) {
      log(error.toString());
    }
    return null;
  }

/*
  Future<List<TripModel>?> getListTrip(int index) async {
    try {
      log(_getFlightTripsEndPoint);
      log(authBox.read('userToken'));
      final response =
      await http.get(Uri.parse(_getFlightTripsEndPoint), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
        'Bearer ${authBox.read('userToken')}',
      });
      print(response.statusCode);
      print(response.body);
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        final responseData = convert.jsonDecode(response.body);
        List<TripModel> myModels;
        myModels = (responseData['trip'] as List)
            .map((i) => TripModel.fromJson(i))
            .toList();
        return myModels;
      } else {
        log("wrong");
      }
    }  catch (error) {
      log(error.toString());
    }
    return null;
  }*/
  Future<List<TripModel>?> getListTrip(int index) async {
    try {
      log(_getFlightTripsEndPoint);
      log(authBox.read('userToken'));
      final request = http.Request(
        'GET',
        Uri.parse(_getFlightTripsEndPoint),
      )..headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
        'Bearer ${authBox.read('userToken')}',
      });
      var params = {
      "CompanyId":"$index"
      };
      request.body = jsonEncode(params);
      var response = await request.send();
      print(response.statusCode);
      print(response.stream);
      if (response.statusCode >= 200 && response.statusCode <= 300) {
       var responseBody = await response.stream.bytesToString();
       print(responseBody);
        final responseData = convert.jsonDecode(responseBody);
        List<TripModel> myModels;
        myModels = (responseData['trip'] as List)
            .map((i) => TripModel.fromJson(i))
            .toList();
        return myModels;
      } else {
        log("wrong");
      }
    }  catch (error) {
      log(error.toString());
    }
    return null;
  }
/*
  Future<TripModel?> getFlightByIndex(int index) async {
    try {
      log(_getFlightTripsEndPoint);
      final response =
      await http.get(Uri.parse("$_getFlightTripsEndPoint$index"));

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        final responseData = convert.jsonDecode(response.body);
        TripModel tripModel = TripModel.fromJson(responseData);
        return tripModel;
      } else {
        log("wrong");
      }
    }catch (error) {
      log(error.toString());
    }
    return null;
  }
*/
}
