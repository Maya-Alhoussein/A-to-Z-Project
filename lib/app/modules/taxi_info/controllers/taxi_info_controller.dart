import 'package:atoz/app/data/models/taxi/taxi_model.dart';
import 'package:atoz/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaxiInfoController extends GetxController {
    var isLikeButtonClicked = false;

    final TaxiModel taxiModel;

  TaxiInfoController(this.taxiModel);



  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

void changeLike(color){
    if (!isLikeButtonClicked){
       color = const Color(0xFFFF9114);
    }
    color = Colors.grey[600];
    update();

}
}
