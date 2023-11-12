import 'package:atoz/app/data/models/hotel/hotel_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HotelDetailsController extends GetxController {
  final HotelModel hotelModel;


  var newItem = 'Single Room  1000\$'.obs;

  List<String> values = [
    'Single Room  1000\$',
    'Double Room 1500\$',
    'Deluxe Room 2000\$',
    'Room with view 2500\$',
    'Suite 3500\$',
    'Presidental Suite 5000\$',
  ].obs;

  final favKey='isfavKey';
  final fav= GetStorage();

  HotelDetailsController(this.hotelModel);

  bool get isfavkey => false;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void savefave(bool isfavkey)=> fav.write(favKey, isfavkey);

}
