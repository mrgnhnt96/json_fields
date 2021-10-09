import 'package:json_annotation/json_annotation.dart';

part 'complex_example.g.dart';

@JsonSerializable(
  // format all key names to snake case
  fieldRename: FieldRename.snake,
)
class Dog {
  final String name;

  final int? ageInHumanYears;

  @JsonKey(defaultValue: 7)
  final int? ageInDogYears;

  final DateTime? birthday;

  // Specify different name key for field
  @JsonKey(name: 'nick-names')
  final List<String>? nicknames;

  Dog({
    required this.name,
    this.ageInHumanYears,
    this.ageInDogYears,
    this.birthday,
    this.nicknames,
  });

  /// Connect the generated [_$DogFromJson] function to the `fromJson`
  /// factory.
  factory Dog.fromJson(Map<String, dynamic> json) => _$DogFromJson(json);

  /// Connect the generated [_$DogToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DogToJson(this);

  /// Connect the generated [_$DogFields] class to the fields getter.
  static _$DogFields get fields => _$DogFields();

  Dog copyWith({
    String? name,
    int? ageInHumanYears,
    int? ageInDogYears,
    DateTime? birthday,
    List<String>? nicknames,
  }) {
    return Dog(
      name: name ?? this.name,
      ageInHumanYears: ageInHumanYears ?? this.ageInHumanYears,
      ageInDogYears: ageInDogYears ?? this.ageInDogYears,
      birthday: birthday ?? this.birthday,
      nicknames: nicknames ?? this.nicknames,
    );
  }
}
