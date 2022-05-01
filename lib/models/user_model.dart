
class UserModel {
      late String email;
      late String name;
      late String number;
      late String em_number;
      late String password;
      late String car_model;
      late String car_color;
      late String image;
      late String uId;

  UserModel({
    required this.email,
    required this.name,
    required this.number,
    required this.em_number,
    required this.password,
    required this.car_model,
    required this.car_color,
    required this.image,
    required this.uId,
  });

      UserModel.fromJason(Map<String, dynamic> json)
      {
        email = json['email'];
        name = json['name'];
        number = json['number'];
        em_number = json['em_number'];
        password = json['password'];
        car_model = json['car_model'];
        car_color = json['car_color'];
        car_color = json['image'];
        uId = json['uId'];
      }

      Map<String, dynamic> toMap()
      {
        return{
          'email':email,
          'name':name,
          'number':number,
          'em_number':em_number,
          'password':password,
          'car_model':car_model,
          'car_color':car_color,
          'image':image,
          'uId':uId,
        };
      }
}