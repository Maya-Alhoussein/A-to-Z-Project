import 'package:get/get.dart';

import '../controllers/flight_list_controller.dart';

class FlightListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlightListController>(
      () => FlightListController(),
    );
  }
}
