class Winshs {
String id;
String name;
String location;
String status;
String uuid;
String phone;


Winshs({
  required this.id,
  required this.name,
  required this.location,
  required this.status,
  required this.phone,
  required this.uuid,
});

Map<String,dynamic> toJson()=>{
  'id': id,
  'name': name ,
  'location': location,
  'status': status,
  'phone': phone,
  'uuid': uuid,
};

static Winshs fromJson(Map<String, dynamic> json) => Winshs(
  id: json['id'],
  name: json['name'],
  location: json['location'],
  status: json['status'],
  uuid: json['uuid'],
  phone: json['phone'],
);



}