import 'package:atoz/app/data/models/Taxi_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/taxi_info_controller.dart';

class TaxiInfoView extends GetView<TaxiInfoController> {
  const TaxiInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaxiInfoController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(300),
          child: AppBar(
            centerTitle: true,
            title: const Text(
              'Taxi info',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_sharp),
              color: Colors.white,
              onPressed: () {
                Get.back();
              },
            ),
            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Taxi.jpg'),
                        fit: BoxFit.fill)),
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
          ),
        ),
        body: Column(children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(children: [
                  const Text(
                    'Name: ',
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'com',
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "${controller.taxiModel.firstName??" "} ${controller.taxiModel.lastName??" "}",
                    style: const TextStyle(
                        color: Colors.black38, fontFamily: 'com', fontSize: 20),
                  ),
                ]),
                const Divider(),
                const SizedBox(height: 40),
                Row(children: [
                  const Text(
                    'Phone: ',
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'com',
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    taxi[0].phone,
                    style: const TextStyle(
                        color: Colors.black38, fontFamily: 'com', fontSize: 20),
                  ),
                ]),
                const Divider(),
                const SizedBox(height: 40),
                Row(children: [
                  const Text(
                    'Country: ',
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'com',
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  const SizedBox(width: 10),
                  Text("${controller.taxiModel.city!.name??" "} ${controller.taxiModel.city!.country!.name ??" "}",

                    style: const TextStyle(
                        color: Colors.black38, fontFamily: 'com', fontSize: 20),
                  ),
                ]),
                const Divider(),
                const SizedBox(height: 40),
                Row(children: [
                  const Text(
                    'Price per Km: ',
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'com',
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    taxi[0].price,
                    style: const TextStyle(
                        color: Colors.black38, fontFamily: 'com', fontSize: 20),
                  ),
                ]),


              ],
            ),
          )


        ]),
      );
    });
  }
}
