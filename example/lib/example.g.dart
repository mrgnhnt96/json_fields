// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// JsonFieldsGenerator
// **************************************************************************

class _$PersonFields {
  const _$PersonFields();
  final String firstName = 'firstName';
  final String lastName = 'lastName';
  final String dateOfBirth = 'date-of-birth';
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      dateOfBirth: json['date-of-birth'] == null
          ? null
          : DateTime.parse(json['date-of-birth'] as String),
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'date-of-birth': instance.dateOfBirth?.toIso8601String(),
    };
