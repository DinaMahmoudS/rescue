class HelpUsers {
  String user_id ;
  String problem ;
  String helpFrom;
  String location;
  String status;
  String color;
  String other;

  HelpUsers({
    required this.user_id,
    required this.problem,
    required this.helpFrom,
    required this.location,
    required this.status,
    required this.color,
    required this.other,
  });

  Map<String,dynamic> toJson()=>{
    'user_id': user_id,
    'problem': problem,
    'helpFrom': helpFrom,
    'location': location,
    'status': status,
    'color': color,
    'other': other,
  };

  static HelpUsers fromJson(Map<String, dynamic> json) => HelpUsers(
    user_id: json['user_id'],
    problem: json['problem'],
    helpFrom: json['helpFrom'],
    location: json['location'],
    status: json['status'],
    color: json['color'],
    other: json['other'],
  );
}