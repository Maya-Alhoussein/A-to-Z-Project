class TourismplacesModel {
  int? id;
  String? name;
  String? location;
  String? img;
  String? description;
  int? views;
  String? createdAt;
  String? updatedAt;
  int? cityId;
  String? city;
  String? country;

  TourismplacesModel(
      {this.id,
        this.name,
        this.location,
        this.img,
        this.description,
        this.views,
        this.createdAt,
        this.updatedAt,
        this.cityId,
        this.city,
        this.country});

  TourismplacesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    img = json['img'];
    description = json['description'];
    views = json['views'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    cityId = json['CityId'];
    city = json['city'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['location'] = location;
    data['img'] = img;
    data['description'] = description;
    data['views'] = views;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['CityId'] = cityId;
    data['city'] = city;
    data['country'] = country;
    return data;
  }
}