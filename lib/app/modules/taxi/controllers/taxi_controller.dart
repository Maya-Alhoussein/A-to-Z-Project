import 'package:atoz/app/data/models/taxi/taxi_model.dart';
import 'package:atoz/app/data/provider/taxi_provider.dart';
import 'package:get/get.dart';

class TaxiController extends GetxController {
  TaxiProvider taxiProvider = TaxiProvider();
  List<TaxiModel>? listTaxies;
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

  void getData() async {
    isLoading = true;
    isError = false;
    update();
    listTaxies = await taxiProvider.getListTaxi();
    isLoading = false;
    if (listTaxies == null) {
      isError = true;
    } else {
      isError = false;
    }
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
