import 'package:get/get.dart';

import '../modules/BookRoomDetails/bindings/book_room_details_binding.dart';
import '../modules/BookRoomDetails/views/book_room_details_view.dart';
import '../modules/book_hotel/bindings/book_hotel_binding.dart';
import '../modules/book_hotel/views/book_hotel_view.dart';
import '../modules/book_restaurant/bindings/book_reastaurant_binding.dart';
import '../modules/book_restaurant/views/book_reastaurant_view.dart';
import '../modules/flight/bindings/flight_binding.dart';
import '../modules/flight/views/flight_view.dart';
import '../modules/flight_list/bindings/flight_list_binding.dart';
import '../modules/flight_list/views/flight_list_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/hotel_details/bindings/hotel_details_binding.dart';
import '../modules/hotel_details/views/hotel_details_view.dart';
import '../modules/hotels_list/bindings/hotels_list_binding.dart';
import '../modules/hotels_list/views/hotels_list_view.dart';
import '../modules/place/bindings/place_binding.dart';
import '../modules/place/views/place_view.dart';
import '../modules/place_list/bindings/place_list_binding.dart';
import '../modules/place_list/views/place_list_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/restaurant_details/bindings/restaurant_details_binding.dart';
import '../modules/restaurant_details/views/restaurant_details_view.dart';
import '../modules/restaurants_list/bindings/restaurants_list_binding.dart';
import '../modules/restaurants_list/views/restaurants_list_view.dart';
import '../modules/saved/bindings/saved_binding.dart';
import '../modules/saved/views/saved_view.dart';
import '../modules/saved_hotels/bindings/saved_hotels_binding.dart';
import '../modules/saved_hotels/views/saved_hotels_view.dart';
import '../modules/saved_places/bindings/saved_places_binding.dart';
import '../modules/saved_places/views/saved_places_view.dart';
import '../modules/saved_restaurants/bindings/saved_restaurants_binding.dart';
import '../modules/saved_restaurants/views/saved_restaurants_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/taxi/bindings/taxi_binding.dart';
import '../modules/taxi/views/taxi_view.dart';
import '../modules/taxi_info/bindings/taxi_info_binding.dart';
import '../modules/taxi_info/views/taxi_info_view.dart';
import '../modules/user_flights/bindings/user_flights_binding.dart';
import '../modules/user_flights/views/user_flights_view.dart';
import '../modules/user_hotels/bindings/user_hotels_binding.dart';
import '../modules/user_hotels/views/user_hotels_view.dart';
import '../modules/user_restaurants/bindings/user_restaurants_binding.dart';
import '../modules/user_restaurants/views/user_restaurants_view.dart';
import '../modules/welcome1/bindings/welcome1_binding.dart';
import '../modules/welcome1/views/welcome1_view.dart';
import '../modules/welcome2/bindings/welcome2_binding.dart';
import '../modules/welcome2/views/welcome2_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.HOTELS_LIST,
      page: () => const HotelsListView(),
      binding: HotelsListBinding(),
    ),
    GetPage(
      name: _Paths.HOTEL_DETAILS,
      page: () => const HotelDetailsView(),
      binding: HotelDetailsBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_HOTEL,
      page: () => const BookHotelView(),
      binding: BookHotelBinding(),
    ),
    GetPage(
      name: _Paths.RESTAURANTS_LIST,
      page: () => const RestaurantsListView(),
      binding: RestaurantsListBinding(),
    ),
    GetPage(
      name: _Paths.RESAURANT_DETAILS,
      page: () => const RestaurantDetailsView(),
      binding: RestaurantDetailsBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_REASTAURANT,
      page: () => const BookRestaurantView(),
      binding: BookRestaurantBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME1,
      page: () => const Welcome1View(),
      binding: Welcome1Binding(),
    ),
    GetPage(
      name: _Paths.WELCOME2,
      page: () => const Welcome2View(),
      binding: Welcome2Binding(),
    ),
    GetPage(
      name: _Paths.TAXI,
      page: () => const TaxiView(),
      binding: TaxiBinding(),
    ),
    GetPage(
      name: _Paths.TAXI_INFO,
      page: () => const TaxiInfoView(),
      binding: TaxiInfoBinding(),
    ),
    GetPage(
      name: _Paths.FLIGHT,
      page: () => const FlightView(),
      binding: FlightBinding(),
    ),
    GetPage(
      name: _Paths.FLIGHT_LIST,
      page: () => const FlightListView(),
      binding: FlightListBinding(),
    ),
    GetPage(
      name: _Paths.PLACE,
      page: () => const PlaceView(),
      binding: PlaceBinding(),
    ),
    GetPage(
      name: _Paths.PLACE_LIST,
      page: () => const PlaceListView(),
      binding: PlaceListBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.USER_FLIGHTS,
      page: () => const UserFlightsView(),
      binding: UserFlightsBinding(),
    ),
    GetPage(
      name: _Paths.USER_HOTELS,
      page: () => const UserHotelsView(),
      binding: UserHotelsBinding(),
    ),
    GetPage(
      name: _Paths.USER_RESTAURANTS,
      page: () => const UserRestaurantsView(),
      binding: UserRestaurantsBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SAVED,
      page: () => const SavedView(),
      binding: SavedBinding(),
    ),
    GetPage(
      name: _Paths.SAVED_HOTELS,
      page: () => const SavedHotelsView(),
      binding: SavedHotelsBinding(),
    ),
    GetPage(
      name: _Paths.SAVED_RESTAURANTS,
      page: () => const SavedRestaurantsView(),
      binding: SavedRestaurantsBinding(),
    ),
    GetPage(
      name: _Paths.SAVED_PLACES,
      page: () => const SavedPlacesView(),
      binding: SavedPlacesBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_ROOM_DETAILS,
      page: () => BookRoomDetailsView(),
      binding: BookRoomDetailsBinding(),
    ),
  ];
}
