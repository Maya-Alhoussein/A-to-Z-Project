import 'package:get/get.dart';

import '../controllers/saved_restaurants_controller.dart';

class SavedRestaurantsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedRestaurantsController>(
      () => SavedRestaurantsController(),
    );
  }
}
