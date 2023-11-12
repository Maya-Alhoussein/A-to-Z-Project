import 'package:atoz/app/data/models/auth/login_model.dart';
import 'package:atoz/app/data/provider/auth_provider.dart';
import 'package:atoz/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  var isPasswordHidden = true.obs;
  final GlobalKey<FormState>loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController,passwordController;
  var email ='maya.hossein@gmail.com';
  var password ='mayamaya';
  late AuthProvider authProvider;



  @override
  void onInit() {
    super.onInit();
    emailController =TextEditingController();
    passwordController =TextEditingController();
    authProvider = AuthProvider();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

 String? validateEmail (String value){
    if (!GetUtils.isEmail(value)){
      return "provide valid email";
    }
    email = value;
    return null;
  }
  String? validatePassword (String value){
    if (value.length<6){
      return "password must be of 6 characters at least ";
    }
    password = value;
    return null;
  }

   checkLogin(){
    final isValid=loginFormKey.currentState!.validate();
    if (!isValid){
      return;
    }
    loginFormKey.currentState!.save();
    performLogin();
  }

  void performLogin()async{
    LoginModel loginModel = LoginModel(email: email,password: password);
    bool x = await authProvider.logIn(loginModel);
    if(x){
      Get.toNamed(Routes.HOME);
    }
  }


}
