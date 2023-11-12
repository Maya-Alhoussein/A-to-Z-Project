import 'package:atoz/app/data/models/trip/trip_model.dart';
import 'package:atoz/app/data/provider/flight_provider.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/location/company_model.dart';

class FlightListController extends GetxController {
  FlightProvider flightProvider = FlightProvider();
  List<CompanyModel>? listCompanies;
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
    listCompanies = await flightProvider.getListCompany();
    isLoading = false;
    if (listCompanies == null) {
      isError = true;
    } else {
      isError = false;
    }
    int i=0;
    for(i;i<listCompanies!.length;i++){
      if(listCompanies![i].name=="Syrian Airlines"){
        listCompanies![i].url="https://syriaair.com/ar/home-ar/";
      }
      else if(listCompanies![i].name=="Cham Wings"){
        listCompanies![i].url="https://chamwings.com/";
      }
      else if(listCompanies![i].name=="Middle East Airlines"){
        listCompanies![i].url="https://www.mea.com.lb/english/plan-and-book/book-a-trip";
      }
      else{
        listCompanies![i].url="https://google.com/";
      }

    }
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }

  launchURL(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // can't launch url
    }
  }
}
