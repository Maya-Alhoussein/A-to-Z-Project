import 'package:atoz/app/data/models/restaurant_model.dart';
import 'package:atoz/app/data/provider/restaurant_provider.dart';
import 'package:get/get.dart';

class RestaurantsListController extends GetxController {
  RestaurantProvider hotelProvider = RestaurantProvider();
  List<RestaurantModel>? listRestaurants;
  bool isLoading = true;
  bool isError = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getData();
    super.onReady();
  }

  void getData ()async{
    isLoading = true;
    isError = false;
    update();
    listRestaurants = await hotelProvider.getListRestaurant();
    isLoading = false;
    if(listRestaurants == null){
      isError = true;
    }
    else
    {
      isError = false;
    }
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
