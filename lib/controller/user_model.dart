class UserModel {
  String gender;
  String name;
  int age;
  String location;
  int photoCount;
  int distance;

  UserModel({
    required this.gender,
    required this.name,
    required this.age,
    required this.location,
    required this.photoCount,
    required this.distance,
  });

   UserModel.fromJson(Map<String, dynamic> json, this.gender, this.name, this.age, this.location, this.photoCount, this.distance) {
    gender = json['gender'];
    name = json['name'];
    age = json['age'];
    location = json['location'];
    photoCount = json['photoCount'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gender'] = gender;
    data['name'] = name;
    data['age'] = age;
    data['location'] = location;
    data['photoCount'] = photoCount;
    data['distance'] = distance;
    return data;
  }
}

