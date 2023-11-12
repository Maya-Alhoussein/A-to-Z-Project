class BookRoomModel {
  String? roomId;
  String? date;
  String? duration;

  BookRoomModel({this.roomId, this.date, this.duration});

  BookRoomModel.fromJson(Map<String, dynamic> json) {
    roomId = json['RoomId'];
    date = json['date'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RoomId'] = this.roomId;
    data['date'] = this.date;
    data['duration'] = this.duration;
    return data;
  }
}