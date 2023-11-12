import 'package:get/get.dart';

import '../../../data/models/tourismplace/tourismplace_model.dart';
import '../../../data/provider/tourismplaces_provider.dart';

class PlaceListController extends GetxController {

  TourismplacesProvider tourismplacesProvider = TourismplacesProvider();
  List<TourismplacesModel>? Tisttourismplacess;
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
    Tisttourismplacess = await tourismplacesProvider.getListTourismplaces();
    isLoading = false;
    if(Tisttourismplacess == null){
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
