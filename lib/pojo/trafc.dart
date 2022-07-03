class Traffic {
  String location;
  String causes;
  String street;
  String uuid;

  Traffic(
      {required this.causes,
      required this.uuid,
      required this.location,
      required this.street});

  Map<String, dynamic> toJson() => {
        'location': location,
        'uuid': uuid,
        'street': street,
        'causes': causes,
      };

  static Traffic fromJson(Map<String, dynamic> json) => Traffic(
        location: json['location'],
        uuid: json['uuid'],
        street: json['street'],
        causes: json['causes'],
      );
}
