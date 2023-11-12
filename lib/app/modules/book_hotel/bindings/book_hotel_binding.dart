import 'package:get/get.dart';

import '../controllers/book_hotel_controller.dart';

class BookHotelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookHotelController>(
      () => BookHotelController(0),
    );
  }
}
