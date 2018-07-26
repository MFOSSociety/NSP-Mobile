import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Object with _$DataSerializerMixin {
  Data(this.url, this.username, this.email, this.groups);

  String url;
  String username;
  String email;
  List<String> groups;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}