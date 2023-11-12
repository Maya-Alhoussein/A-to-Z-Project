import 'package:atoz/app/data/provider/auth_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  late AuthProvider authProvider;
  GetStorage authBox = GetStorage();

  String getEmail(){
    String x = authBox.read('userEmail')??"";
    update();
   return x;
  }

  @override
  void onInit() {
    authProvider = AuthProvider();
    super.onInit();
  }

  void performLogOut(){
    authProvider.logOut();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
