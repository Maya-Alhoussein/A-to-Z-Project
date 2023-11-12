import 'package:get/get.dart';

import '../controllers/user_flights_controller.dart';

class UserFlightsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserFlightsController>(
      () => UserFlightsController(),
    );
  }
}
