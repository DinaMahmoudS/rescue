class Traffic {
  String location;
  String causes;
  String uuid;

  Traffic({required this.causes, required this.uuid, required this.location});

  Map<String, dynamic> toJson() => {
        'location': location,
        'uuid': uuid,
        'causes': causes,
      };

  static Traffic fromJson(Map<String, dynamic> json) => Traffic(
        location: json['location'],
        uuid: json['uuid'],
        causes: json['causes'],
      );
}
