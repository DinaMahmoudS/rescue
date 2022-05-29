class timeline{
  String Content ;
  String Date ;
  String name ;

  timeline({
    required this.Content,
    required this.Date,
    required this.name,
  });

  Map<String,dynamic> toJson()=>{
    'Content': Content,
    'Date': Date,
    'name': name,
  };

  static timeline fromJson(Map<String, dynamic> json) => timeline(
    Content: json['Content'],
    Date: json['Date'],
    name: json['name'],
  );
}