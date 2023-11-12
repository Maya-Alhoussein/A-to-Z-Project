import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_flights_controller.dart';

class UserFlightsView extends GetView<UserFlightsController> {
  const UserFlightsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.arrow_back),
              color: const Color(0xffff9114),
              onPressed: () =>Get.back(),

            ),
          ),

          title: const Text(
            'Your Flights',
            style: TextStyle(
              color: Color(0xffff9114),
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body:
        buildRestaurantItem()

    );
  }
  Widget buildRestaurantItem()=>Column(
    children: [

      ListTile(
        leading: Container(
          width: 110,


          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset('assets/images/FreeVector-Syrian-Air.jpg'
            ,fit: BoxFit.cover,

          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Syrian air',
                style:TextStyle(
                    fontSize: 15,
                    fontFamily: 'Comfortaa',
                    color: Colors.black,
                    fontWeight: FontWeight.bold

                )),
            const SizedBox(height: 5,),
            Row(
              children: const [
                Text('Syria',
                    style:TextStyle(
                      fontSize: 15,
                      fontFamily: 'Comfortaa',
                      color: Colors.black,

                    )),


              ],
            ),
            SizedBox(height: 10,),

          ],
        ),
        subtitle: Row(
          children: const [
            Text('14/7/2022',
              style: TextStyle(
                  fontSize: 15
              ),),

            SizedBox(width: 35,),


          ],
        ) ,


      ),
      const SizedBox(height: 20,
      ),

      Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Container(
          height: 1,

          color: Colors.grey[300],

        ),
      )

    ],
  );

  }

