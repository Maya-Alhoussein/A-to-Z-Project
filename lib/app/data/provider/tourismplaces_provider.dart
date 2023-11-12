import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:atoz/app/core/contsants/consts.dart';
import 'package:atoz/app/data/models/tourismplace/tourismplace_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/tourismplace/tourismplace_model.dart';

class TourismplacesProvider {
  final GetStorage authBox = GetStorage();
  String _getTourismplacessEndPoint = '';
  String _getTourismplacesDetailsEndPoint = '';
  String? mainUrl = '';

  TourismplacesProvider() {
    mainUrl = baseUrl;
    _getTourismplacessEndPoint = '${mainUrl!}/tourismplace/index';
    _getTourismplacesDetailsEndPoint = '${mainUrl!}/tourismplace/';
  }

  Future<List<TourismplacesModel>?> getListTourismplaces() async {
    try {
      log(_getTourismplacessEndPoint);
      log(authBox.read('userToken'));
      final response = await http.get(Uri.parse(_getTourismplacessEndPoint), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
        'Bearer ${authBox.read('userToken')}',
      });

      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        final responseData = convert.jsonDecode(response.body);
        List<TourismplacesModel> myModels;
        myModels = (responseData['tourismplaces'] as List)
            .map((i) => TourismplacesModel.fromJson(i))
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

  Future<TourismplacesModel?> getTourismplacesByIndex(int index) async {
    try {
      log(_getTourismplacesDetailsEndPoint);
      final response =
      await http.get(Uri.parse("$_getTourismplacesDetailsEndPoint$index"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
        'Bearer ${authBox.read('userToken')}',
      });

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        final responseData = convert.jsonDecode(response.body);
        TourismplacesModel tourismplaceModel = TourismplacesModel.fromJson(responseData);
        return tourismplaceModel;
      } else {
        log("wrong");
      }
    }catch (error) {
      log(error.toString());
    }
    return null;
  }
}
