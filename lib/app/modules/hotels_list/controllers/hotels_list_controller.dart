import 'package:atoz/app/data/provider/hotel_provider.dart';
import 'package:get/get.dart';

import '../../../data/models/hotel/hotel_model.dart';

class HotelsListController extends GetxController {

  HotelProvider hotelProvider = HotelProvider();
  List<HotelModel>? listHotels;
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
    listHotels = await hotelProvider.getListHotel();
    isLoading = false;
    if(listHotels == null){
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
