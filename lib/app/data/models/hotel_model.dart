class HotelModel {
  String image, name, location, phone, city;
  int price, id, views;
  double numberofstars;

  HotelModel(
      {required this.id,
      required this.name,
      required this.location,
      required this.image,
      required this.views,
      required this.numberofstars,
      required this.phone,
      required this.city,
      required this.price});

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
        id: json['id'],
        name: json['name'],
        location: json['location'],
        image: json['image'],
        views: json['views'],
        numberofstars: json['numberofstars'],
        phone: json['phone'],
        city: json['city'],
        price: json['price'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "image": image,
        "views": views,
        "numberofstars": numberofstars,
        "phone": phone,
        "city": city,
        "price": price
      };
}
