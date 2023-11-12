import 'package:atoz/app/data/models/auth/user_model.dart';

class SignupModel {
  UserModel? user;

  SignupModel({this.user});

  SignupModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ?   UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
