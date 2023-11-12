import 'package:get/get.dart';

import '../controllers/welcome1_controller.dart';

class Welcome1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Welcome1Controller>(
      () => Welcome1Controller(),
    );
  }
}
