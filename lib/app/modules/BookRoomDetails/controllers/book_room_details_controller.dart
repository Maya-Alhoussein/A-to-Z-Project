import 'package:atoz/app/data/provider/hotel_provider.dart';
import 'package:atoz/app/data/provider/hotel_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookRoomDetailsController extends GetxController {
  var selected_date = DateTime.now().obs;
  final int roomId;
  int days = 0;
  HotelProvider hotelProvider = HotelProvider();
  bool isLoading = false;

  BookRoomDetailsController(this.roomId);

  performBook()async{
    isLoading = true;
    update();
    await hotelProvider.bookHotelRoom(roomId,selected_date.string ,(days).toString());
    isLoading = false;
    update();
  }

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

  showDate() async {
    DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: Color(0xFFFF9114))), child: child!,);
      },
      context: Get.context!,
      initialDate: selected_date.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != selected_date.value) {
      selected_date.value = pickedDate;
    }
  }
}
