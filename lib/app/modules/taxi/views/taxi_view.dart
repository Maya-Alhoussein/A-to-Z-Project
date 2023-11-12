import 'package:atoz/app/data/models/Taxi_list.dart';
import 'package:atoz/app/data/models/taxi/taxi_model.dart';
import 'package:atoz/app/modules/taxi_info/controllers/taxi_info_controller.dart';
import 'package:atoz/app/modules/taxi_info/views/taxi_info_view.dart';
import 'package:atoz/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/taxi_controller.dart';

class TaxiView extends GetView<TaxiController> {
  const TaxiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaxiController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: orange,
            title: const Text('Taxi'),
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
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 13.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.listTaxies!.length,
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    Get.delete<TaxiInfoController>();
                                    Get.put<TaxiInfoController>(TaxiInfoController(controller.listTaxies![index]));
                                    Get.to(()=> const TaxiInfoView());
                                  },
                                  child: TaxiCard(
                                      taxiModel: controller.listTaxies![index]),
                                )),
                      )));
    });
  }
}

class TaxiCard extends StatelessWidget {
  const TaxiCard({Key? key, required this.taxiModel}) : super(key: key);
  final TaxiModel taxiModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              height: 100.0,
              width: 90.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0),
                borderRadius: BorderRadius.circular(90),
              ),
              child:   ClipRRect(
                borderRadius:BorderRadius.circular(90),
                child: Image.asset('assets/images/Taxi.jpg',fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${taxiModel.firstName!} ${taxiModel.lastName!}",
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w900)),
            const SizedBox(height: 5),
            Text("${taxiModel.city!.name!} ${taxiModel.city!.country!.name!}",
                style: TextStyle(fontSize: 15, color: Colors.grey[700])),
          ],
        )
      ],
    );
  }
}
