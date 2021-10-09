// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_example.dart';

// **************************************************************************
// JsonFieldsGenerator
// **************************************************************************

class _$DogFields {
  const _$DogFields();
  final String name = 'name';
  final String ageInHumanYears = 'age_in_human_years';
  final String ageInDogYears = 'age_in_dog_years';
  final String birthday = 'birthday';
  final String nicknames = 'nick-names';
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dog _$DogFromJson(Map<String, dynamic> json) => Dog(
      name: json['name'] as String,
      ageInHumanYears: json['age_in_human_years'] as int?,
      ageInDogYears: json['age_in_dog_years'] as int? ?? 7,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      nicknames: (json['nick-names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DogToJson(Dog instance) => <String, dynamic>{
      'name': instance.name,
      'age_in_human_years': instance.ageInHumanYears,
      'age_in_dog_years': instance.ageInDogYears,
      'birthday': instance.birthday?.toIso8601String(),
      'nick-names': instance.nicknames,
    };
