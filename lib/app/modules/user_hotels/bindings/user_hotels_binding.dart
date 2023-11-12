import 'package:get/get.dart';

import '../controllers/user_hotels_controller.dart';

class UserHotelsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserHotelsController>(
      () => UserHotelsController(),
    );
  }
}
