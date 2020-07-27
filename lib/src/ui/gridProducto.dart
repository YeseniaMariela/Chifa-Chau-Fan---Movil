import 'package:chaufan/src/model/pedido.dart';
import 'package:flutter/material.dart';

class CarritoItem extends StatefulWidget {
  final Producto producto;

  CarritoItem({Key key, @required this.producto}) : super(key: key);
  @override
  _CarritoItemState createState() => _CarritoItemState();
}

class _CarritoItemState extends State<CarritoItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: InkWell(
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 0.0, right: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.width / 3.5,
                width: MediaQuery.of(context).size.width / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    "http://206.189.173.158:3000/static/products/${widget.producto.imagen}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "${widget.producto.nombre}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Text(
                      'S/. ${widget.producto.precioUnidad}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(width: 10.0),
                  ],
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
