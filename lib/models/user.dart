import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class UserModel {
  String id;
  String name;
  String phonenumber;
  String birthday;
  String gender;
  String password;

  UserModel({this.phonenumber, this.birthday, this.gender, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
