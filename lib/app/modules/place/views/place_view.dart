import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:get/get.dart';

import '../controllers/place_controller.dart';

class PlaceView extends GetView<PlaceController> {
  const PlaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlaceController>(builder: (controller) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(300),
          child: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_sharp),
              color: Colors.white,
              onPressed: () => Get.back(),
            ),
            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/maldives.jpg'),
                        fit: BoxFit.fill)),
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      controller.tourismplacesModel.name!,
                      style: const TextStyle(
                        fontSize: 30,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 1000,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Wrap(
                        runSpacing: 10,
                        children: [
                          const Text(
                            'Description: ',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            controller.tourismplacesModel.description ?? "",
                            style: const TextStyle(
                              fontSize: 17,
                              fontFamily: 'Comfortaa',
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),

                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Location: ',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            controller.tourismplacesModel.location ?? '',
                            style: const TextStyle(
                              fontSize: 17,
                              fontFamily: 'Comfortaa',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 190,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.visibility,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('${controller.places[0].views}',
                              style: const TextStyle(
                                  fontSize: 15.0, color: Colors.black)),
                          const SizedBox(width: 250),
                          FavoriteButton(
                              isFavorite: false,
                              iconSize: 40,
                              valueChanged: () {
                                controller.savefave(true);
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
