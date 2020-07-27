import 'package:http/http.dart'show Client;

import 'package:chaufan/src/model/pedido.dart';
import 'conexion.dart';


class PedidoService {
  Client client = Client();

  Future<List<Pedido>> getPedido() async {
    final response = await client.get("$url/sales-report");
    if (response.statusCode == 200) {
      return pedidoFromJson(response.body);
    } else {
      return null;
    }
  }
}