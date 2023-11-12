import 'package:atoz/app/data/models/hotel/room_model.dart';
import 'package:atoz/app/data/models/hotels.dart';
import 'package:atoz/app/modules/BookRoomDetails/controllers/book_room_details_controller.dart';
import 'package:atoz/app/modules/BookRoomDetails/views/book_room_details_view.dart';
import 'package:atoz/app/routes/app_pages.dart';
import 'package:atoz/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_hotel_controller.dart';

class BookHotelView extends GetView<BookHotelController> {
  const BookHotelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookHotelController>(builder: (controller) {
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
                title: const Text('Rooms',
                    style: TextStyle(color: Colors.black26)),
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
                              itemCount: controller.listRoom!.length,
                              itemBuilder: (context, index) =>
                                  RoomCard(controller.listRoom![index])))));
    });
  }
}

class RoomCard extends StatelessWidget {
  RoomCard(this.room, {Key? key}) : super(key: key);
  final RoomModel room;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
                    child: const Center(
                      child: Icon(Icons.hotel),
                    )),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("type: ${room.type!}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w900)),
                const SizedBox(height: 5),
                Text("price: ${room.price!}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w900)),
                const SizedBox(height: 5),
                Text("roomSize: ${room.roomSize.toString()}",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700])),
              ],
            )
          ],
        ),
        TextButton(
            onPressed: () {
              Get.delete<BookRoomDetailsController>();
              Get.put(BookRoomDetailsController(room.id ?? 0));
              Get.to(() => BookRoomDetailsView());
            },
            child: Text(
              "Book",
              style: TextStyle(color: Colors.orange),
            ))
      ],
    );
  }
}
