import 'dart:convert';

class Pedido {
  int id;
  String fecha;
  String hora;
  num descuento;
  String descripcionDesc;
  num total;
  String observaciones;
  String estado;
  int numeroPersonas;
  int mesaId;
  int clienteId;
  String createdAt;
  String updatedAt;
  List<Producto> productos;
  String numeroMesa;
  String cliente;
  String clienteEmail;
  String numCelular;

  Pedido(
      {this.id,
      this.fecha,
      this.hora,
      this.descuento,
      this.descripcionDesc,
      this.total,
      this.observaciones,
      this.estado,
      this.numeroPersonas,
      this.mesaId,
      this.clienteId,
      this.createdAt,
      this.updatedAt,
      this.productos,
      this.numeroMesa,
      this.cliente,
      this.clienteEmail,
      this.numCelular});

  Pedido.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fecha = json['fecha'];
    hora = json['hora'];
    descuento = json['descuento'];
    descripcionDesc = json['descripcionDesc'];
    total = json['total'];
    observaciones = json['observaciones'];
    estado = json['estado'];
    numeroPersonas = json['numeroPersonas'];
    mesaId = json['mesaId'];
    clienteId = json['clienteId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['productos'] != null) {
      productos = new List<Producto>();
      json['productos'].forEach((v) {
        productos.add(new Producto.fromJson(v));
      });
    }
    numeroMesa = json['numeroMesa'];
    cliente = json['cliente'];
    clienteEmail = json['clienteEmail'];
    numCelular = json['numCelular'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fecha'] = this.fecha;
    data['hora'] = this.hora;
    data['descuento'] = this.descuento;
    data['descripcionDesc'] = this.descripcionDesc;
    data['total'] = this.total;
    data['observaciones'] = this.observaciones;
    data['estado'] = this.estado;
    data['numeroPersonas'] = this.numeroPersonas;
    data['mesaId'] = this.mesaId;
    data['clienteId'] = this.clienteId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.productos != null) {
      data['productos'] = this.productos.map((v) => v.toJson()).toList();
    }
    data['numeroMesa'] = this.numeroMesa;
    data['cliente'] = this.cliente;
    data['clienteEmail'] = this.clienteEmail;
    data['numCelular'] = this.numCelular;
    return data;
  }
}

class Producto {
  int id;
  String nombre;
  num precioUnidad;
  String descripcion;
  String imagen;
  Null estado;
  int categoriaId;
  String createdAt;
  String updatedAt;
  int cantidad;

  Producto(
      {this.id,
      this.nombre,
      this.precioUnidad,
      this.descripcion,
      this.imagen,
      this.estado,
      this.categoriaId,
      this.createdAt,
      this.updatedAt,
      this.cantidad});

  Producto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    precioUnidad = json['precioUnidad'];
    descripcion = json['descripcion'];
    imagen = json['imagen'];
    estado = json['estado'];
    categoriaId = json['categoriaId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    cantidad = json['cantidad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['precioUnidad'] = this.precioUnidad;
    data['descripcion'] = this.descripcion;
    data['imagen'] = this.imagen;
    data['estado'] = this.estado;
    data['categoriaId'] = this.categoriaId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['cantidad'] = this.cantidad;
    return data;
  }
}

Pedido pedidoFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return Pedido.fromJson(data);
}
