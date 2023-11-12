import 'package:atoz/app/data/models/restaurants.dart';
import 'package:atoz/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

import '../controllers/saved_restaurants_controller.dart';

class SavedRestaurantsView extends GetView<SavedRestaurantsController> {
  const SavedRestaurantsView({Key? key}) : super(key: key);

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
                            restaurants[0].image,
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
                        Text(restaurants[0].name,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w900)),
                        const SizedBox(height: 5),
                        Text(restaurants[0].location,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700])),
                        const SizedBox(
                          height: 5.0,
                        ),
                        RatingBar.builder(
                            unratedColor: Colors.grey[300],
                            itemSize: 20,
                            initialRating: restaurants[0].numberofstars,
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
