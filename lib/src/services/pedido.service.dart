import 'dart:io';

import 'package:http/http.dart' show Client;

import 'package:chaufan/src/model/pedido.dart';
import 'conexion.dart';

class PedidoService {
  Client client = Client();

  Future<Pedido> getPedido(pedidoId) async {
    final response = await client.get("$url/ventas/app/$pedidoId");
    if (response.statusCode == 200) {
      return pedidoFromJson(response.body);
    } else
      return null;
  }

  Future updateStatus(pedidoId) async {
    final response = await client.put('$url/ventas/updateStatus/$pedidoId',
        body: {"estado": "ATENDIDO"});
    if (response.statusCode == 200) {
      return true;
    }
  }
}
