import 'package:atoz/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_hotels_controller.dart';

class UserHotelsView extends GetView<UserHotelsController> {
  const UserHotelsView({Key? key}) : super(key: key);
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
              onPressed: () =>Get.back()
            ),
          ),

          title: const Text(
            'Hotels you stayed at',
            style: TextStyle(
              color: Color(0xffff9114),
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body:
        buildHotelItem()

    );
  }
  Widget buildHotelItem()=>Column(
    children: [

      ListTile(
        leading: Container(
          //width: 170,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset('assets/images/download.jpg'
            ,fit: BoxFit.cover,

          ),
        ),
        title: const Text('Dama Rose',
            style:TextStyle(
                fontSize: 15,
                fontFamily: 'Comfortaa',
                color: Colors.black,
                fontWeight: FontWeight.bold

            )),

        subtitle: Row(
          children:  [

            Text('24/9/2022',
              style: TextStyle(
                  fontSize: 15
              ),),
             SizedBox(width: 50),
             Column(
               children: [
                 Text('2 Days',
                   style: TextStyle(
                       fontSize: 15
                   ),
                 ),
                 SizedBox(height: 10),
                 Text('Jounior : 300000',
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
