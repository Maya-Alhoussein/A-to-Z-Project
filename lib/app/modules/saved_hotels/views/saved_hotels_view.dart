import 'package:atoz/app/data/models/hotels.dart';
import 'package:atoz/app/modules/hotels_list/views/hotels_list_view.dart';
import 'package:atoz/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

import '../controllers/saved_hotels_controller.dart';

class SavedHotelsView extends GetView<SavedHotelsController> {
  const SavedHotelsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) => Row(
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
                          child: Image.asset(
                            hotels[1].image,
                            fit: BoxFit.fill,
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
                        Text(hotels[1].name,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w900)),
                        const SizedBox(height: 5),
                        Text(hotels[1].location,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700])),
                        RatingBar.builder(
                            unratedColor: Colors.grey[300],
                            itemSize: 20,
                            initialRating: hotels[0].numberofstars,
                            itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: orange,
                                ),
                            onRatingUpdate: (rating) {})
                      ],
                    )
                  ],
                )));
  }
}
