import 'package:json_fields_example/complex_example.dart';
import 'package:json_fields_example/example.dart';

void main() async {
  final repo = Repo();

  final john = Person(
    firstName: 'John',
    lastName: 'Doe',
    dateOfBirth: null,
  );

  final rufus = Dog(
    name: 'Rufus',
    ageInDogYears: 21,
    ageInHumanYears: 3,
    nicknames: ['Rufus', 'Rufus the Great'],
  );

  await repo.savePerson(john);

  await repo.saveFirstName(john.firstName);

  await repo.saveDog(rufus);

  await repo.updateDogsBirthday(DateTime(2018, 5, 12), rufus);
}

class Repo {
  Future<void> savePerson(Person person) async {
    final json = person.toJson();

    // expected output: {"firstName":"John","lastName":"Doe", "dateOfBirth":null}
    print(json);
  }

  Future<void> saveFirstName(String firstName) async {
    // get the `firstName` key from the Person class
    final firstNameKey = Person.fields.firstName;

    final json = {firstNameKey: firstName};

    // expected output: {'firstName': 'John'}
    print(json);
  }

  Future<void> saveDog(Dog dog) async {
    final json = dog.toJson();

    // expected output: {name: Rufus, age_in_human_years: 3, age_in_dog_years: 21, birthday: null, nick-names: [Rufus, Rufus the Great]}
    print(json);
  }

  Future<void> updateDogsBirthday(DateTime birthday, Dog dog) async {
    final updatedDog = dog.copyWith(birthday: birthday);

    final dogJson = updatedDog.toJson();

    // get the `birthday` key from the Dog class
    final birthdayKey = Dog.fields.birthday;

    // create a new json object with the updated birthday ONLY
    final json = {birthdayKey: dogJson[birthdayKey]};

    // expected output: {birthday: 2018-05-12T00:00:00.000}
    print(json);
  }
}
