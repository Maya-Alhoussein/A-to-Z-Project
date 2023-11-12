import 'package:atoz/app/data/models/restaurant_model.dart';
import 'package:get/get.dart';

import '../controllers/restaurant_details_controller.dart';

class RestaurantDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantDetailsController>(
      () => RestaurantDetailsController(RestaurantModel()),
    );
  }
}
