class DriverDetails {
  String comuID ;
  String email ;
  String name ;
  String status;
  String phone ;
  String nationalID ;
  String password ;
  String plates;
  String uId ;

  DriverDetails({
    required this.status,
    required this.comuID,
    required this.email,
    required this.name,
    required this.phone,
    required this.nationalID,
    required this.password,
    required this.plates,
    required this.uId,
  });

  Map<String,dynamic> toJson()=>{
    'comuID': comuID,
    'email': email,
    'name': name,
    'phone': phone,
    'nationalID': nationalID,
    'password': password,
    'plates': plates,
    'status': status,
    'uId': uId,
  };

  static DriverDetails fromJson(Map<String, dynamic> json) => DriverDetails(
    comuID: json['comuID'],
    email: json['email'],
    name: json['name'],
    phone: json['phone'],
    status: json['status'],
    nationalID: json['nationalID'],
    password: json['password'],
    plates: json['plates'],
    uId: json['uId'],
  );


}