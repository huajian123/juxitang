class UserEntity {
  String _phone;
  String _password;

  UserEntity({String phone, String password}) {
    this._phone = phone;
    this._password = password;
  }

  String get phone => _phone;
  set phone(String phone) => _phone = phone;
  String get password => _password;
  set password(String password) => _password = password;

  UserEntity.fromJson(Map<String, dynamic> json) {
    _phone = json['phone'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this._phone;
    data['password'] = this._password;
    return data;
  }
}
