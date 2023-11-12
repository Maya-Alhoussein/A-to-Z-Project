class CompanyModel {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? url="https://chamwings.com/";

  CompanyModel({this.id, this.name, this.createdAt, this.updatedAt});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}