import 'package:atoz/app/modules/home/views/home_view.dart';
import 'package:atoz/app/routes/app_pages.dart';
import 'package:atoz/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: controller.loginFormKey,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Sign in',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 18,
            ),
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            height: 900,
            child: Column(
              children: [
                const Expanded(
                  child: Form(
                    child: Center(
                      child: Image(
                        image: AssetImage('assets/images/pp.png'),
                        height: 280.0,
                        width: 290.0,
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Welcome Back',
                  style: TextStyle(color: Colors.black, fontSize: 35.0),
                ),
                const SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextFormField(
                    controller: controller.emailController,
                    onSaved: (value) {
                      controller.email = value!;
                    },
                    validator: (value) {
                      return controller.validateEmail(value!);
                    },
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      ),
                      labelText: 'Email',
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black),
                          gapPadding: 10.0),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black),
                          gapPadding: 10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Obx(
                      () => TextFormField(
                        controller: controller.passwordController,
                        onSaved: (value) {
                          controller.password = value!;
                        },
                        validator: (value) {
                          return controller.validatePassword(value!);
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: controller.isPasswordHidden.value,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(controller.isPasswordHidden.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: Colors.grey,
                            onPressed: () {
                              controller.isPasswordHidden.value =
                                  !controller.isPasswordHidden.value;
                            },
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.black),
                              gapPadding: 10.0),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.black),
                              gapPadding: 10.0),
                        ),
                      ),
                    )),
                const SizedBox(height: 20.0),
                Center(
                  child: FloatingActionButton.extended(
                      backgroundColor: orange,
                      foregroundColor: Colors.black,
                      label: const Text('Sign in'),
                      onPressed: () async {
                       // Get.toNamed(Routes.HOME);
                        controller.checkLogin();
                      }),
                ),
                const SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 110),
                  child: Row(
                    children: [
                      const Text(
                        'New User ?',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.SIGN_UP);
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: orange, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
