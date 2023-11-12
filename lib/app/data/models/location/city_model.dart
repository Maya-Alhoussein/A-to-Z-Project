
import 'country_model.dart';

class City {
  String? name;
  Country? country;

  City({this.name, this.country});

  City.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country =
    json['Country'] != null ? Country.fromJson(json['Country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (country != null) {
      data['Country'] = country!.toJson();
    }
    return data;
  }
}