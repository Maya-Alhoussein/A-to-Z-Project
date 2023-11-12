import 'package:atoz/app/data/models/location/city_model.dart';

class RestaurantModel {
  int? id;
  String? name;
  String? phoneNumber;
  String? location;
  String? img;
  int? stars;
  int? views;
  String? createdAt;
  String? updatedAt;
  int? cityId;
  City? city;

  RestaurantModel(
      {this.id,
        this.name,
        this.phoneNumber,
        this.location,
        this.img,
        this.stars,
        this.views,
        this.createdAt,
        this.updatedAt,
        this.cityId,
        this.city});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    location = json['location'];
    img = json['img'];
    stars = json['stars'];
    views = json['views'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    cityId = json['CityId'];
    city = json['City'] != null ? City.fromJson(json['City']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['location'] = location;
    data['img'] = img;
    data['stars'] = stars;
    data['views'] = views;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['CityId'] = cityId;
    if (city != null) {
      data['City'] = city!.toJson();
    }
    return data;
  }
}
