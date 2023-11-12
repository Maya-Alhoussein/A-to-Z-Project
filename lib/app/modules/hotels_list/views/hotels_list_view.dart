import 'package:atoz/app/data/models/hotel/hotel_model.dart';
import 'package:atoz/app/modules/home/views/home_view.dart';
import 'package:atoz/app/modules/hotel_details/controllers/hotel_details_controller.dart';
import 'package:atoz/app/modules/hotel_details/views/hotel_details_view.dart';
import 'package:atoz/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/hotels_list_controller.dart';

class HotelsListView extends GetView<HotelsListController> {
  const HotelsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelsListController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: orange,
                /*
                leading: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white),*/
                title: const Text('Hotels',
                    style: TextStyle(color: Colors.white)),
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
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.listHotels!.length,
                              itemBuilder: (context, index) =>
                                  HotelCard(controller.listHotels![index])))));
    });
  }
}

class HotelCard extends StatelessWidget {
  HotelCard(this.hotel, {Key? key}) : super(key: key);
  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.delete<HotelDetailsController>();
        Get.put(HotelDetailsController(hotel));
        Get.to(() => HotelDetailsView());
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
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
                child: Image.network(
                  hotel.img ?? "",
                  fit: BoxFit.fill,
                  errorBuilder: (context, exception, stackTrace) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Image.asset('assets/images/Room.png',
                            fit: BoxFit.cover));
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(hotel.name!,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w900)),
              const SizedBox(height: 5),
              Text(hotel.location!,
                  style: TextStyle(fontSize: 15, color: Colors.grey[700])),
              RatingBar.builder(
                ignoreGestures: true,
                  unratedColor: Colors.grey[300],
                  itemSize: 20,
                  initialRating: hotel.stars!.toDouble(),
                  itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: orange,
                      ),
                  onRatingUpdate: (rating) {})
            ],
          )
        ],
      ),
    );
  }
}
