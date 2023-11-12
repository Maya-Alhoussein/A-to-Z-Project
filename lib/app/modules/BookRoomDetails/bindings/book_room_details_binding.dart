import 'package:get/get.dart';

import '../controllers/book_room_details_controller.dart';

class BookRoomDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookRoomDetailsController>(
      () => BookRoomDetailsController(1),
    );
  }
}
