import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {

  GetStorage authBox = GetStorage();

  String getEmail(){
    String x = authBox.read('userEmail') ?? "";
    update();
    return x;
  }
  var selected_image_path=''.obs;


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
  void getImage(ImageSource imageSource)async{
    final picked_file= await ImagePicker().getImage(source: imageSource);
    if(picked_file!=null)
    {
      selected_image_path.value=picked_file.path;
    }
    else {
      Get.snackbar('Error', 'No Image Selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xffff9114),
          colorText: Colors.white);
    }
  }





}
