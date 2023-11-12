import 'package:atoz/app/routes/app_pages.dart';
import 'package:atoz/constants.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Form(
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('Sign Up',
                style: TextStyle(color: Colors.grey[400], fontSize: 18)),
            leading: IconButton(
                color: Colors.black45,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                })),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(children: [
            Expanded(
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: controller.loginFormKey,
                child: SingleChildScrollView(
                  child: Column(children: [
                    const Center(
                      child: Text(
                        'Welcome !',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Please make an account to plan all your travels with us',
                        style: TextStyle(
                            color: orange,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: controller.fnameController,
                      onSaved: (value){
                        controller.fname=value!;
                      },
                      validator: (value){
                        return controller.validatefname(value!);
                      },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        labelText: 'First Name',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: controller.lnameController,
                      onSaved: (value){
                        controller.lname=value!;
                      },
                      validator: (value){
                        return controller.validatelname(value!);
                      },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        labelText: 'Last Name',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: controller.emailController,
                      onSaved: (value){
                        controller.email=value!;
                      },
                      validator: (value){
                        return controller.validateEmail(value!);
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        ),
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: controller.passwordController,
                      onSaved: (value){
                        controller.password=value!;
                      },
                      validator: (value){
                        return controller.validatePassword(value!);
                      },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.black,
                        ),
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: controller.phoneController,
                      onSaved: (value){
                        controller.phone=value!;
                      },
                      validator: (value){
                        return controller.validatephone(value!);
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.phone_android,
                          color: Colors.black,
                        ),
                        labelText: 'Phone Number',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      width: 500.0,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: CountryCodePicker(
                        initialSelection: 'US',
                        showCountryOnly: true,
                        showOnlyCountryWhenClosed: true,
                        hideSearch: false,
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    Center(
                      child: FloatingActionButton.extended(
                          backgroundColor: orange,
                          foregroundColor: Colors.black,
                          label: const Text('Next'),
                          onPressed: () async{
                            controller.checkSignup();
                            //controller.performSignup();
                          }),
                    )
                  ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
