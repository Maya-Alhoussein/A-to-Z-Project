import 'package:atoz/app/data/provider/restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookRestaurantController extends GetxController {
  var selected_date = DateTime.now().obs;
  List<String> items = ['Normal Table', 'VIP Table'].obs;
  var selectedItem = 'Normal Table'.obs;
  int tableType=1;
  int hours = 0;
  RestaurantProvider restaurantProvider = RestaurantProvider();
  bool isLoading = false;

  performBook()async{
    isLoading = true;
    update();
    await restaurantProvider.bookTableRestaurant(selected_date.string, tableType,hours*60);
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
