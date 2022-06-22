class UserData {
  String email;
  String name;
  String number;
  String em_number;
  String password;
  String car_model;
  String car_color;
  String status;
  String uId;
  String image;

  UserData({
    required this.email,
    required this.name,
    required this.number,
    required this.em_number,
    required this.password,
    required this.car_model,
    required this.status,
    required this.car_color,
    required this.uId,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'number': number,
        'status': status,
        'em_number': em_number,
        'password': password,
        'car_model': car_model,
        'car_color': car_color,
        'uId': uId,
        'image': image,
      };

  static UserData fromJson(Map<String, dynamic> json) => UserData(
        email: json['email'],
        name: json['name'],
        number: json['number'],
        em_number: json['em_number'],
        status: json['status'],
        password: json['password'],
        car_model: json['car_model'],
        car_color: json['car_color'],
        uId: json['uId'],
        image: json['image'],
      );
}
