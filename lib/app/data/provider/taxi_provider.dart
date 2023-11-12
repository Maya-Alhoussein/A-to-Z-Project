import 'dart:async';
import 'dart:developer';
import 'package:atoz/app/core/contsants/consts.dart';
import 'package:atoz/app/data/models/taxi/taxi_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TaxiProvider {
  final GetStorage authBox = GetStorage();
  String _getTaxisEndPoint = '';
  String _getTaxiDetailsEndPoint = '';
  String? mainUrl = '';

  TaxiProvider() {
    mainUrl = baseUrl;
    _getTaxisEndPoint = '${mainUrl!}/taxi/index';
    _getTaxiDetailsEndPoint = '${mainUrl!}/taxi/';
  }

  Future<List<TaxiModel>?> getListTaxi() async {
    try {
      log(_getTaxisEndPoint);
      log(authBox.read('userToken'));
      final response = await http.get(Uri.parse(_getTaxisEndPoint), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authBox.read('userToken')}',
      });

      print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        final responseData = convert.jsonDecode(response.body);
        List<TaxiModel> myModels;
        myModels = (responseData['taxi'] as List)
            .map((i) => TaxiModel.fromJson(i))
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

  Future<TaxiModel?> getTaxiByIndex(int index) async {
    try {
      log(_getTaxiDetailsEndPoint);
      final response =
          await http.get(Uri.parse("$_getTaxiDetailsEndPoint$index"));

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        final responseData = convert.jsonDecode(response.body);
        TaxiModel taxiModel = TaxiModel.fromJson(responseData);
        return taxiModel;
      } else {
        log("wrong");
      }
    } catch (error) {
      log(error.toString());
    }
    return null;
  }
}
