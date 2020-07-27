import 'dart:convert';

class Producto {
  int id;
  String name;
  String description;
  int categoryId;
  String unitPrice;
  String photo;
  Null status;
  String createAt;

  Producto(
      {this.id,
      this.name,
      this.description,
      this.categoryId,
      this.unitPrice,
      this.photo,
      this.status,
      this.createAt});

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
    id : json['id'],
    name : json['name'],
    description : json['description'],
    categoryId : json['category_id'],
    unitPrice : json['unit_price'],
    photo : json['photo'],
    status : json['status'],
    createAt : json['create_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['category_id'] = this.categoryId;
    data['unit_price'] = this.unitPrice;
    data['photo'] = this.photo;
    data['status'] = this.status;
    data['create_at'] = this.createAt;
    return data;
  }
}
List<Producto> productoFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Producto>.from(data.map((item) => Producto.fromJson(item)));
}