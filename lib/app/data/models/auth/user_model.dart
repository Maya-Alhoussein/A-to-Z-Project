
class UserModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? password;

  UserModel(
      {this.firstName,
        this.lastName,
        this.phoneNumber,
        this.email,
        this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}