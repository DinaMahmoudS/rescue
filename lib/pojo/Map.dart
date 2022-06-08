class Google_Map {
  String id;
  String latitude;
  String longitude;

  Google_Map({
    this.id = '',
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson()=>{
    'id': id,
    'latitude': latitude ,
    'longitude': longitude,
  };

  static Google_Map fromJson(Map<String, dynamic> json) => Google_Map(
    id: json['id'],
    longitude: json['longitude'],
    latitude: json['latitude'],
  );
}