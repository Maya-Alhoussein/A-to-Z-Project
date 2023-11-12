class RoomModel {
  int? id;
  String? type;
  int? roomSize;
  String? img;
  int? price;
  String? createdAt;
  String? updatedAt;
  int? hotelId;

  RoomModel(
      {this.id,
        this.type,
        this.roomSize,
        this.img,
        this.price,
        this.createdAt,
        this.updatedAt,
        this.hotelId});

  RoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    roomSize = json['room_size'];
    img = json['img'];
    price = json['price'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    hotelId = json['HotelId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['room_size'] = this.roomSize;
    data['img'] = this.img;
    data['price'] = this.price;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['HotelId'] = this.hotelId;
    return data;
  }
}