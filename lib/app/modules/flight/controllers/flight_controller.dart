import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlightController extends GetxController {
  final count = 0.obs;
  late final DateTime date;
  var selected_date = DateTime.now().obs;

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



  // Show the modal that contains the CupertinoDatePicker
  showDate() async {
    DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(primary: Color(0xFFFF9114))), child: child!,);
      },
      context: Get.context!,
      initialDate: selected_date.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != selected_date.value) {
      selected_date.value = pickedDate;
    }
  }
}
