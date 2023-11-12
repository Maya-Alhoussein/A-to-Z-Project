import 'package:atoz/app/data/models/location/company_model.dart';
import 'package:atoz/app/data/models/trip/trip_model.dart';
import 'package:atoz/app/modules/book_hotel/views/book_hotel_view.dart';
import 'package:atoz/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../book_hotel/controllers/book_hotel_controller.dart';
import '../controllers/flight_list_controller.dart';

class FlightListView extends GetView<FlightListController> {
  const FlightListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightListController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffFF9114),
        ),
        body: (controller.isLoading)
            ? Container(
                width: MediaQuery.of(context).size.width,
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
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.topLeft,
                          width: double.infinity,
                          height: 120,
                          decoration: const BoxDecoration(
                              color: Color(0xffff9114),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                              )),
                          child: const Text(
                            'Flights',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 350,
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => buildFlightItem(
                                controller.listCompanies![index],
                                () => controller
                                    .launchURL(controller.listCompanies![index].url!)),
                            itemCount: controller.listCompanies!.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
      );
    });
  }

  Widget buildFlightItem(CompanyModel companyModel, Function fun) => InkWell(
        onTap: () => fun(),
        child: Container(
          height: 190,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                blurRadius: 7.0,
                // spreadRadius: 0.1,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/plane.png',
                    width: 60,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                companyModel.name ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Comfortaa',
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.FLIGHT),
                    child: const Text(
                      'view details',
                      style: TextStyle(
                        color: Color(0xffff9114),
                        fontSize: 15,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      );
}
