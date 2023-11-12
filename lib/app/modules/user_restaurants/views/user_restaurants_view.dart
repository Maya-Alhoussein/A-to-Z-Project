import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_restaurants_controller.dart';

class UserRestaurantsView extends GetView<UserRestaurantsController> {
  const UserRestaurantsView({Key? key}) : super(key: key);
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
            'Restaurants you went to',
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
          //width: 170,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset('assets/images/mcdonald-s-logo-255A7B5646-seeklogo.com.png'
            ,fit: BoxFit.cover,

          ),
        ),
        title: const Text('McDonald\'s',
            style:TextStyle(
                fontSize: 15,
                fontFamily: 'Comfortaa',
                color: Colors.black,
                fontWeight: FontWeight.bold
            )),
        subtitle: Row(
          children:  [
            SizedBox(height: 10,),
            Text('20/9/2022',
              style: TextStyle(
                  fontSize: 15
              ),),
            SizedBox(width: 50),
            Column(
              children: [
                Text('VIP Table',
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),
                SizedBox(height: 10),
                Text('4 People',
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),SizedBox(height: 10),
                Text('2 Hours',
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),


                //      Text('2 Days',
                //       style: TextStyle(
                //         fontSize: 15
                // ),
                // ),
              ],
            ),

          ],
        ) ,


      ),
      const SizedBox(height: 10,
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
