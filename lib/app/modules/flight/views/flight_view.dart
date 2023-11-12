import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/flight_controller.dart';

class FlightView extends GetView<FlightController> {
  const FlightView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(FlightController());
    return Scaffold(

      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffFF9114),
        leading: Builder(
          builder: (context) =>
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () => Get.back(),
              ),
        ),

      ),

      body:
      Stack(
          children: [
            Container(
              height: double.infinity,
              width: 500,
              color: Colors.white70,
            ),

            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(
                  color: Color(0xffff9114),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),

                  )
              ),
              child: const Text(
                'Book Your Flight',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            Positioned(
                top: 130,
                right: 50,
                child: Container(

                  width: 300,
                  height: 350,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                )
            ),
            const Positioned(
              top: 170,
              right: 130,
              child:
              Text('Choose your country',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: 15,
                ),),),
            Positioned(
              top: 200,
              right: 80,
              child:
              Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),

                ),
                child:
                CountryCodePicker(
                  initialSelection: 'US',
                  showCountryOnly: true,
                  showOnlyCountryWhenClosed: true,
                  hideSearch: false,
                ),
              ),
            ),
            const Positioned(
              top: 265,
              right: 110,
              child:
              Text('Choose your destination',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: 15,
                ),),),
            Positioned(
              top: 295,
              right: 80,
              child:
              Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),

                ),
                child:
                CountryCodePicker(

                  initialSelection: 'US',
                  showCountryOnly: true,
                  showOnlyCountryWhenClosed: true,
                  hideSearch: false,
                ),
              ),

            ),
            const Positioned(
              top: 360,
              right: 135,
              child:
              Text('Choose the date',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: 15,
                ),),),
            Positioned(
              top: 390,
              right: 80,
              child: InkWell(
                onTap: () => controller.showDate(),
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    border: Border.all(),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() {
                          return Text(
                            DateFormat("dd-MM-yyy")
                                .format(controller.selected_date.value)
                                .toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Comfortaa',

                            ),);
                        }),
                        const Icon(Icons.arrow_right_outlined,
                            color: Color(0xffff9114)),
                      ]
                  ),

                ),
              ),


            ),


            Positioned(
              top: 455,
              right: 130,

              child: Container(
                //alignment: Alignment.center,
                width: 130,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //primary: Color(0xffFF9100),
                    primary: const Color(0xFFff9114),
                    onPrimary: Colors.black,
                  ),

                  onPressed: () {},


                  child: Row(
                      children: const [
                        Text('  Search   ',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold,


                          ),),
                        Icon(Icons.search,
                          color: Colors.white,),
                      ]
                  ),

                ),


              ),

            ),

            Positioned(
              top: 480,
              right: 130,

              child: Container(
                //alignment: Alignment.center,
                //width: 130,

                  child: Image.asset(
                    'assets/images/paper_airplane.png',
                    width: 230,
                  )


              ),

            ),


          ]
      ),


    );
  }
}
