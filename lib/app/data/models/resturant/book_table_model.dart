class BookTableModel {
  String? tableId;
  String? date;
  String? time;

  BookTableModel({this.tableId, this.date, this.time});

  BookTableModel.fromJson(Map<String, dynamic> json) {
    tableId = json['TableId'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TableId'] = this.tableId;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}