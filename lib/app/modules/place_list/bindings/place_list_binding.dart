import 'package:get/get.dart';

import '../controllers/place_list_controller.dart';

class PlaceListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaceListController>(
      () => PlaceListController(),
    );
  }
}
