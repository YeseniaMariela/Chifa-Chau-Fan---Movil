import 'dart:convert';

class Detalle {
  int id;
  int saleId;
  int productId;
  String unitPrice;
  int quantity;
  String price;

  Detalle(
      {this.id,
      this.saleId,
      this.productId,
      this.unitPrice,
      this.quantity,
      this.price});

  factory Detalle.fromJson(Map<String, dynamic> json) {
    return Detalle(
      id: json['id'],
      saleId: json['sale_id'],
      productId: json['product_id'],
      unitPrice: json['unit_price'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sale_id'] = this.saleId;
    data['product_id'] = this.productId;
    data['unit_price'] = this.unitPrice;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    return data;
  }
}

List<Detalle> detalleFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Detalle>.from(data.map((item) => Detalle.fromJson(item)));
}
