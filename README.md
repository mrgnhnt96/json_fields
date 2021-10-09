
[![Pub Package](https://img.shields.io/pub/v/json_fields.svg)](https://pub.dev/packages/json_fields)

Hi! 👋 ,
This is [JSON Fields][package:json_fields], a package that helps you to work with JSON data.

[package:json_fields] is a library that generates a class to access the __serialized__ names of the fields in your Dart Object.

## Motivation 💪

I have frequently come across situations where I want to store a JSON object in a database,
but I don't want to update the entire object every time I make a change.

The only way to get around this was to type out the key/field name in the request or create a static variable within the class. All of this is tedious, prone to typos/incorrect formatting/errors, its not [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself), and can require all developers working on the project to know the DB structure. 😣 😬

[package:json_fields] leverages [package:json_annotation] to create the `fields` class, making
a fast addition to your already serialized classes.

## Setup 🖥

To configure your project for the latest released version of
`json_fields` see the [example].

## Example 🧐

_Also see the [example][example]_

In `example.dart` we have a `Person` class annotated with
@[`JsonSerializable`]:

```dart
import 'package:json_annotation/json_annotation.dart';

part 'example.g.dart';

@JsonSerializable()
class Person {
  /// The generated code assumes these values exist in JSON.
  final String firstName, lastName;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final DateTime? dateOfBirth;

  Person({required this.firstName, required this.lastName, this.dateOfBirth});

  /// Connect the generated [_$PersonFields] class to the fields getter.
  static _$PersonFields get fields => _$PersonFields();


  // --- json_serializable ---
  //! fromJson & toJson are not required to use `json_fields`
  //! but they are included here for completeness.

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PersonToJson(this);

}
```

Building creates the corresponding part `example.g.dart`:

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// JsonFieldsGenerator
// **************************************************************************

class _$PersonFields {
  const _$PersonFields();
  final String firstName = 'firstName';
  final String lastName = 'lastName';
  final String dateOfBirth = 'dateOfBirth';
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
    };

```

Accessing the JSON key fields:

```dart
{
  // 'firstName': 'John'
  Person.fields.firstName: 'John',
}
```

# Running the code generator 🏃‍♂️

Once you have added the annotations to your code you then need to run the code
generator to generate the missing `.g.dart` generated dart files.

If this file already exists, the `json_fields` tool will prepend the generated code

In your package directory you can run the following command:

- For Dart:
`dart run build_runner build`

- For Flutter:
`flutter pub run build_runner build`

# Annotation values 😎

The only annotation required to use this package is [`JsonSerializable`]. When
applied to a class (in a correctly configured package), the `fields`
class will be generated when you build. There are three ways to control how code
is generated:

1. Setting properties on [`JsonKey`] annotating the target field.
2. Set properties on [`JsonSerializable`] annotating the target type.
3. Add configuration to `build.yaml` – [more here](https://pub.dev/packages/json_serializable#build-configuration).

*for more information: [package:json_serializable]*

[example]: https://github.com/mrgnhnt96/json_fields/tree/main/example
[package:json_annotation]: https://pub.dev/packages/json_annotation
[package:json_serializable]: https://pub.dev/packages/json_serializable
[package:json_fields]: https://pub.dev/packages/json_fields
[`JsonKey`]: https://pub.dev/documentation/json_annotation/latest/json_annotation/JsonKey-class.html
[`JsonSerializable`]: https://pub.dev/documentation/json_annotation/latest/json_annotation/JsonSerializable-class.html
