import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/saved_places_controller.dart';

class SavedPlacesView extends GetView<SavedPlacesController> {
  const SavedPlacesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(15.0),
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
                          ),],
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.asset('assets/images/maldives.jpg',
                          width: 500,
                          height: 200,
                          fit: BoxFit.cover),


                    ),



                  ],
                )
              ]
          ),
        ),
        ) );
  }
}
