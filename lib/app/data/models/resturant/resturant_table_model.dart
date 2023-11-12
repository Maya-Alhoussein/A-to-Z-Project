class ResturantTableModel {
  int? id;
  String? type;
  int? seating;
  String? img;
  String? createdAt;
  String? updatedAt;
  int? restaurantId;

  ResturantTableModel(
      {this.id,
        this.type,
        this.seating,
        this.img,
        this.createdAt,
        this.updatedAt,
        this.restaurantId});

  ResturantTableModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    seating = json['seating'];
    img = json['img'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    restaurantId = json['RestaurantId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['seating'] = this.seating;
    data['img'] = this.img;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['RestaurantId'] = this.restaurantId;
    return data;
  }
}