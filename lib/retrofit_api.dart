import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'retrofit_api.g.dart';

@RestApi(baseUrl: "https://www.json-generator.com/api/json/get/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("/ceLGCumWjS?indent=2")
  Future<List<Post>> getTasks();
}

//terminal run to build the .g.dart file ***:flutter pub run build_runner build
@JsonSerializable()
class Post{
  int index;
  String name;
  String picture;
  String gender;
  int age;
  String email;
  String phone;
  String company;

  Post({this.index, this.name, this.picture, this.gender, this.age, this.email, this.phone, this.company});

  @override
  String toString() {
    return 'Post{index: $index, name: $name, picture: $picture, gender: $gender, age: $age, email: $email, phone: $phone, company: $company}';
  }

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}