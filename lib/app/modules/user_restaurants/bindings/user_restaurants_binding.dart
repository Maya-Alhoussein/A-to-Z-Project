import 'package:get/get.dart';

import '../controllers/user_restaurants_controller.dart';

class UserRestaurantsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRestaurantsController>(
      () => UserRestaurantsController(),
    );
  }
}
