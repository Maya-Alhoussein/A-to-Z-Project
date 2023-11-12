import 'package:atoz/app/data/models/taxi/taxi_model.dart';
import 'package:get/get.dart';

import '../controllers/taxi_info_controller.dart';

class TaxiInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaxiInfoController>(
      () => TaxiInfoController(TaxiModel()),
    );
  }
}
