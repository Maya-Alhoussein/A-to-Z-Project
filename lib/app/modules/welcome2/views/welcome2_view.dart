import 'package:atoz/app/modules/welcome1/views/welcome1_view.dart';
import 'package:atoz/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/welcome2_controller.dart';

class Welcome2View extends GetView<Welcome2Controller> {
  const Welcome2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          const SizedBox(
            height: 1000,
            width: 1000,
            child: Image(
              image: AssetImage('assets/images/welcome.png'),
            ),
          ),
          Positioned(
            bottom: 110,
            right: 125,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),

              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.offNamed(Routes.WELCOME1);
                },
                child: const Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 30,

                  ),
                ),

                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
