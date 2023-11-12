import 'package:get/get.dart';

import '../controllers/saved_hotels_controller.dart';

class SavedHotelsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedHotelsController>(
      () => SavedHotelsController(),
    );
  }
}
