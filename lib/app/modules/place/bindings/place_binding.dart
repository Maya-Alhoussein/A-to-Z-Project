import 'package:atoz/app/data/models/tourismplace/tourismplace_model.dart';
import 'package:get/get.dart';

import '../controllers/place_controller.dart';

class PlaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaceController>(
      () => PlaceController(TourismplacesModel()),
    );
  }
}
