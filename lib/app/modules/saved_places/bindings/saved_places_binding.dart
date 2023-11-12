import 'package:get/get.dart';

import '../controllers/saved_places_controller.dart';

class SavedPlacesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedPlacesController>(
      () => SavedPlacesController(),
    );
  }
}
