import 'package:chaufan/src/model/detalle.dart';
import 'package:http/http.dart'show Client;

import 'package:chaufan/src/model/producto.dart';
import 'conexion.dart';


class ProductoService {
  Client client = Client();

  Future<List<Producto>> getProducto(int saleId) async {
    final response = await client.get("$url/products");
    final detalle = await client.get("http://206.189.173.158:3000/api/sale-detail-by-sale?sale_id=$saleId");
    if (response.statusCode == 200 && detalle.statusCode == 200 ) {
      List<Detalle> detalle1 = detalleFromJson(detalle.body);
      List<Producto> productos = productoFromJson(response.body);
      List<Producto> productos1 = [];
      for (var item in productos) {
        for (var det in detalle1) {
          if (item.id== det.productId) {
            productos1.add(item);
          }
        }
      }
      return productos1;
    } else {
      return null;
    }
  }
}