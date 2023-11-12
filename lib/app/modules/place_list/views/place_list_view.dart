import 'package:atoz/app/data/models/place_model.dart';
import 'package:atoz/app/data/models/resturant/book_table_model.dart';
import 'package:atoz/app/data/models/tourismplace/tourismplace_model.dart';
import 'package:atoz/app/modules/place/controllers/place_controller.dart';
import 'package:atoz/app/modules/place/views/place_view.dart';
import 'package:atoz/app/routes/app_pages.dart';
import 'package:atoz/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/place_list_controller.dart';

class PlaceListView extends GetView<PlaceListController> {
  const PlaceListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlaceListController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: orange,
            title: const Text(
              'Beautiful Places',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: (controller.isLoading)
              ? Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CupertinoActivityIndicator(),
              ],
            ),
          )
              : (controller.isError)
              ? const Center(
            child: Text(
              "There is an error!!",
              style: TextStyle(fontSize: 22),
            ),
          )
              :
          SingleChildScrollView(
            child: Column(
                children: [
                  const SizedBox(height: 30,),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => buildPlaceItem(controller.Tisttourismplacess![index]),
                    itemCount: controller.Tisttourismplacess!.length,
                    separatorBuilder: (context, index) =>
                    const SizedBox(height: 20,),
                  ),
                ]
            ),
          )
      );
    });
  }

  Widget buildPlaceItem(TourismplacesModel tourismplacesModel) =>
      InkWell(
        onTap: () {

          Get.delete<PlaceController>();
          Get.put(PlaceController(tourismplacesModel));
          Get.to(() => const PlaceView());

        },
        child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 370,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          blurRadius: 7.0,
                          // spreadRadius: 0.1,
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset('assets/images/simple-abstract-orange-background-gradient-waves-117722512.jpg',
                        width: 500,
                        height: 200,
                        fit: BoxFit.cover),
                  ),
                  Align(alignment: Alignment.bottomCenter,
                  child: Text(tourismplacesModel.name??"",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                  )
                ],
              )
            ]
        ),
      );
}

