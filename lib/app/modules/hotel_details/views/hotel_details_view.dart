import 'package:atoz/app/modules/book_hotel/controllers/book_hotel_controller.dart';
import 'package:atoz/app/modules/book_hotel/views/book_hotel_view.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/hotel_details_controller.dart';

class HotelDetailsView extends GetView<HotelDetailsController> {
  const HotelDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelDetailsController>(builder: (controller) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(300),

          child: AppBar(
            centerTitle: true,
            title: Text(
              controller.hotelModel.name!,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ), /*
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_sharp),
            color: Colors.black,
            onPressed: () {
              Get.toNamed(Routes.HOTELS_LIST);
            },
          ),*/
            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Room.png'),
                        fit: BoxFit.fill)),
              ),
            ),
            backgroundColor: orange,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(controller.hotelModel.name??'',
                                style: const TextStyle(fontSize: 20.0)),
                          ),
                          const SizedBox(width: 120.0),
                          RatingBar.builder(
                            ignoreGestures: true,
                              unratedColor: Colors.grey[300],
                              itemSize: 20,
                              initialRating:(controller.hotelModel.stars??0).toDouble(),
                              itemBuilder: (context, _) =>
                              const Icon(
                                Icons.star,
                                color: orange,
                              ),
                              onRatingUpdate: (rating) {})
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Text('${controller.hotelModel.location} , ${controller.hotelModel.city!.name!}',
                                style: const TextStyle(
                                    fontSize: 15.0, color: Colors.black)),
                          ),
                          const SizedBox(width: 155.0),
                          Icon(Icons.visibility, color: Colors.grey[400],),
                          const SizedBox(width: 5,),
                          Text('${controller.hotelModel.views}', style:
                          const TextStyle(fontSize: 15.0, color: Colors.black))
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 60.0, bottom: 8.0),
                        child: Text(
                          'type of rooms',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                          width: 250,
                          height: 60,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Colors.black),
                              ),
                            ),
                            value: controller.newItem.value,
                            items: controller.values
                                .map((value) =>
                                DropdownMenuItem<String>(
                                    value: value.isNotEmpty ? value : null,
                                    child: Text(value,
                                        style: const TextStyle(fontSize: 15))))
                                .toList(),
                            onChanged: (value) {
                              controller.newItem.value = value as String;
                            },
                          )),
                      const SizedBox(height: 13),
                      Row(
                        children: [
                          Text('contact us : ${controller.hotelModel.phoneNumber}',
                              style: const TextStyle(fontSize: 20)),
                        ],
                      ),
                      const SizedBox(height: 80),
                      Row(
                        children: [
                          FavoriteButton(
                              isFavorite: false,
                              iconSize: 40,
                              valueChanged: () {
                                controller.savefave(true);
                              }),
                          SizedBox(width: 80,),
                          Center(
                              child: FloatingActionButton.extended(
                                  onPressed: () {
                                    Get.delete<BookHotelController>();
                                    Get.put(BookHotelController(controller.hotelModel.id??0));
                                    Get.to(() => BookHotelView());
                                  },
                                  backgroundColor: orange,
                                  foregroundColor: Colors.black,
                                  label: const Text(
                                    'BOOK NOW',
                                  ))),
                        ],
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
