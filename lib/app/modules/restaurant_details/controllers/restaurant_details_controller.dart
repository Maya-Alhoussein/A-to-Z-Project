import 'package:atoz/app/data/models/restaurant_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RestaurantDetailsController extends GetxController {
  List<String> items = ['Normal Table', 'VIP Table'].obs;
  var selectedItem = 'Normal Table'.obs;

 final  RestaurantModel restaurantModel;


  final favKey='isfavKey';
  final fav= GetStorage();

  RestaurantDetailsController(this.restaurantModel);
  bool get isfavkey => false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    final splitted = restaurantModel.createdAt!.split('T');
    final splitted2 = splitted[1].split(':');
    restaurantModel.createdAt = splitted2[0] +":"+ splitted2[1];


    final splitted3 = restaurantModel.updatedAt!.split('T');
    final splitted4 = splitted3[1].split(':');
    restaurantModel.updatedAt =  "${int.parse(splitted4[0])+10}:${splitted4[1]}";
    update();

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void savefave(bool isfavkey)=> fav.write(favKey, isfavkey);

}
