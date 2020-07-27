import 'package:chaufan/src/utils/const.dart';
import 'package:chaufan/src/ui/detalle.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:chaufan/src/services/pedido.service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String barcode;
  Future _scan() async {
    String barcode = await scanner.scan();
    setState(() => this.barcode = barcode);
  }

  PedidoService pedidoService;
  @override
  void initState() {
    super.initState();
    pedidoService = PedidoService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                padding: EdgeInsets.all(30),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0)),
                color: Constants.rojo1,
                child: Text(
                  "Selecciona tu pedido",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: () async {
                  await _scan();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DetallePedido(
                          pedidoId: barcode,
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
