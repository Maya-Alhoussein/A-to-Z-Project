import 'package:atoz/app/data/models/auth/signup_model.dart';
import 'package:atoz/app/data/models/auth/user_model.dart';
import 'package:atoz/app/data/provider/auth_provider.dart';
import 'package:atoz/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController,
      passwordController,
      fnameController,
      lnameController,
      phoneController;
  var email = '';
  var password = '';
  var fname = '';
  var lname = '';
  var phone = '';
  late AuthProvider authProvider;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fnameController = TextEditingController();
    lnameController = TextEditingController();
    phoneController = TextEditingController();
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
    fnameController.dispose();
    lnameController.dispose();
    phoneController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "provide valid email";
    }
    email = value;
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "password must be of 6 characters at least ";
    }
    password = value;
    return null;
  }

  String? validatefname(String value) {
    if (value.length < 3) {
      return "name must be of 3 characters at least ";
    }
    fname = value;
    return null;
  }

  String? validatelname(String value) {
    if (value.length < 3) {
      return "name must be of 3 characters at least ";
    }
    lname = value;
    return null;
  }

  String? validatephone(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      return "phone number required";
    }
    phone = value;
    return null;
  }

  void checkSignup() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    performSignup();
    loginFormKey.currentState!.save();
  }

  void performSignup() async{
    print("fname: $fname");
    UserModel userModel = UserModel(
        firstName: fname,
        lastName: lname,
        password: password,
        email: email,
        phoneNumber: phone);
    SignupModel signupModel = SignupModel(user: userModel);
    bool x = await authProvider.signUp(signupModel);
    if (x) {
      Get.toNamed(Routes.HOME);
    }
  }
}
