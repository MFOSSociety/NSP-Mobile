// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return new Data(
      json['url'] as String,
      json['username'] as String,
      json['email'] as String,
      (json['groups'] as List)?.map((e) => e as String)?.toList());
}

abstract class _$DataSerializerMixin {
  String get url;
  String get username;
  String get email;
  List<String> get groups;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'username': username,
        'email': email,
        'groups': groups
      };
}
