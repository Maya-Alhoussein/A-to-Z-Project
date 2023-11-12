import 'package:atoz/app/data/models/location/airport_model.dart';
import 'package:atoz/app/data/models/location/company_model.dart';

class TripModel {
  int? id;
  String? from;
  String? to;
  String? date;
  String? time;
  String? period;
  String? createdAt;
  String? updatedAt;
  int? airportId;
  int? companyId;
  Airport? airport;
  CompanyModel? company;

  TripModel(
      {this.id,
      this.from,
      this.to,
      this.date,
      this.time,
      this.period,
      this.createdAt,
      this.updatedAt,
      this.airportId,
      this.companyId,
      this.airport,
      this.company});

  TripModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    from = json['from'];
    to = json['to'];
    date = json['date'];
    time = json['time'];
    period = json['period'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    airportId = json['AirportId'];
    companyId = json['CompanyId'];
    airport =
        json['Airport'] != null ? Airport.fromJson(json['Airport']) : null;
    company =
        json['Company'] != null ? CompanyModel.fromJson(json['Company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['from'] = from;
    data['to'] = to;
    data['date'] = date;
    data['time'] = time;
    data['period'] = period;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['AirportId'] = airportId;
    data['CompanyId'] = companyId;
    if (airport != null) {
      data['Airport'] = airport!.toJson();
    }
    if (company != null) {
      data['Company'] = company!.toJson();
    }
    return data;
  }
}
