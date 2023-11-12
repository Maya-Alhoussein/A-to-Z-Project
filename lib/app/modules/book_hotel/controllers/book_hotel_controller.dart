import 'package:atoz/app/data/models/hotel/hotel_model.dart';
import 'package:atoz/app/data/models/hotel/room_model.dart';
import 'package:atoz/app/data/models/trip/trip_model.dart';
import 'package:atoz/app/data/provider/flight_provider.dart';
import 'package:atoz/app/data/provider/hotel_provider.dart';
import 'package:atoz/app/modules/flight/controllers/flight_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookHotelController extends GetxController {
  final int index;
  HotelProvider hotelProvider = HotelProvider();
  List<RoomModel>? listRoom;
  bool isLoading = true;
  bool isError = false;

  BookHotelController(this.index);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getData();
    super.onReady();
  }

  void getData ()async{
    isLoading = true;
    isError = false;
    update();
    listRoom = await hotelProvider.getListHotelRoom(index);
    isLoading = false;
    if(listRoom == null){
      isError = true;
    }
    else
    {
      isError = false;
    }
    update();
  }

  performBook(){

  }

  @override
  void onClose() {
    super.onClose();
  }

}
