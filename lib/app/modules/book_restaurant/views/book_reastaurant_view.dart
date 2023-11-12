import 'dart:ffi';

import 'package:atoz/app/data/models/restaurants.dart';
import 'package:atoz/app/routes/app_pages.dart';
import 'package:atoz/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/book_reastaurant_controller.dart';

class BookRestaurantView extends GetView<BookRestaurantController> {
  const BookRestaurantView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookRestaurantController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: orange,
          ),
          body: Stack(children: [
            Container(
              height: double.infinity,
              width: 500,
              color: Colors.white70,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                  color: orange,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  )),
              child: const Text(
                'Book Your Table',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Positioned(
                top: 110,
                right: 35,
                child: Container(
                  width: 330,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => controller.showDate(),
                          child: Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              border: Border.all(),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Obx(() {
                                    return Text(
                                      DateFormat("dd-MM-yyy")
                                          .format(
                                              controller.selected_date.value)
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Comfortaa',
                                      ),
                                    );
                                  }),
                                  const Icon(Icons.arrow_right_outlined,
                                      color: Color(0xffff9114)),
                                ]),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: 250,
                          height: 60,
                          child: DropdownButtonFormField(
                              decoration: const InputDecoration(),
                              value: controller.selectedItem.value,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: controller.items
                                  .map((item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(item,
                                          style:
                                              const TextStyle(fontSize: 15))))
                                  .toList(),
                              onChanged: (item) {
                                controller.selectedItem.value = item as String;
                                controller.tableType =
                                    (item == "Normal Table") ? 1 : 2;
                              }),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: 250,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                suffixIcon: Icon(
                                  Icons.people_alt_rounded,
                                  color: Colors.black26,
                                ),
                                hintText: 'number of people',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Comfortaa',
                                  fontSize: 15,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: 250,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                suffixIcon: Icon(
                                  Icons.timelapse,
                                  color: Colors.black26,
                                ),
                                hintText: 'hours',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Comfortaa',
                                  fontSize: 15,
                                )),
                            onChanged: (v) {
                              controller.hours = int.parse(v);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        (controller.isLoading)?
                        const Center(child: CupertinoActivityIndicator()):
                        Container(
                          width: 330,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              controller.performBook();
                            },
                            child: const Text(
                              'BOOK NOW',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ]));
    });
  }
}
