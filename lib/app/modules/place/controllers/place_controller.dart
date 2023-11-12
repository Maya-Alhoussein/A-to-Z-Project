import 'package:atoz/app/data/models/tourismplace/tourismplace_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/place_model.dart';
class PlaceController extends GetxController {
  final TourismplacesModel tourismplacesModel;

  List<Place> places =
  [
    Place(
      views: 300, name: 'mmm', description: '', open: 1, governorate: '', lat: 2, type: '', free: '', close: 6, lng: 3,

    )
  ];
  final favKey='isfavKey';
  final fav= GetStorage();

  PlaceController(this.tourismplacesModel);

  bool get isfavkey => false;
  @override
  //late bool fav;
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
