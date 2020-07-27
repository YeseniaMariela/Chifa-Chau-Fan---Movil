class Mesa {
  int id;
  String name;
  int number;
  String photo;
  String createAt;

  Mesa({this.id, this.name, this.number, this.photo, this.createAt});

  factory Mesa.fromJson(Map<String, dynamic> json) {
    return Mesa(
    id : json['id'],
    name : json['name'],
    number : json['number'],
    photo : json['photo'],
    createAt : json['create_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number'] = this.number;
    data['photo'] = this.photo;
    data['create_at'] = this.createAt;  
    return data;
  }
}