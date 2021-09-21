class Person {

  String name;
  String last;
  String gender;

  DateTime dob;
  int age;

  String country;
  String city;

  String email;
  String phone;

  String imageUrl;

  bool get isMinor => age < 18;

  Person.fromJson(Map json) {
    this.name = json["name"]["first"];
    this.last = json["name"]["last"];
    this.gender = json["gender"];

    this.dob = DateTime.parse(json["dob"]["date"]);
    this.age = json["dob"]["age"];

    this.country = json["location"]["country"];
    this.city = json["location"]["city"];

    this.email = json["email"];
    this.phone = json["phone"];
    this.imageUrl = json["picture"]["large"];
  }
}