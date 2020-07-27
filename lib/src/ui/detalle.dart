import 'package:animated_dialog_box/animated_dialog_box.dart';
import 'package:chaufan/src/ui/home.dart';
import 'package:chaufan/src/utils/const.dart';
import 'package:chaufan/src/widgets/pedidoItem.dart';
import 'package:flutter/material.dart';
import 'package:chaufan/src/model/pedido.dart';
import 'package:chaufan/src/services/pedido.service.dart';

class DetallePedido extends StatefulWidget {
  String pedidoId;

  DetallePedido({this.pedidoId});

  @override
  _DetallePedidoState createState() => _DetallePedidoState();
}

class _DetallePedidoState extends State<DetallePedido> {
  PedidoService pedidoService;
  @override
  void initState() {
    pedidoService = PedidoService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Color(0xFFB94845),
          ),
          elevation: 0,
          titleSpacing: 10,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[],
              ),
            ],
          ),
        ),
        body: _cuerpo(context));
  }

  Widget _cuerpo(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: pedidoService.getPedido(widget.pedidoId),
        builder: (BuildContext context, AsyncSnapshot<Pedido> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Algo  salió mal: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            Pedido pedido = snapshot.data;
            return new Padding(
              padding: EdgeInsets.fromLTRB(25, 30, 25, 25),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Fecha de Reserva',
                      style: TextStyle(color: Constants.rojo3, fontSize: 22),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                    ),
                    Text(
                      pedido.fecha,
                      style: TextStyle(
                        color: Constants.rojo1,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Hora de Reserva',
                      style: TextStyle(color: Constants.rojo3, fontSize: 22),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Text(
                      pedido.hora,
                      style: TextStyle(
                        color: Constants.rojo1,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                    ),
                    Divider(
                      height: 25,
                      color: Colors.grey[300],
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                pedido.cliente,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Constants.rojo1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Mesa N° ${pedido.numeroMesa}",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Constants.rojo1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Cantidad de comensales: ${pedido.numeroPersonas}",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Constants.rojo1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Estado: ${pedido.estado}",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Constants.rojo1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )),
                    Divider(
                      height: 25,
                      color: Colors.grey[300],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Text(
                      'BUFFETS DE COMIDA',
                      style: TextStyle(
                        color: Constants.rojo3,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: pedido.productos == null
                          ? 0
                          : pedido.productos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PedidoItem(
                          producto: pedido.productos[index],
                        );
                      },
                    ),
                    Divider(
                      height: 30,
                      color: Colors.red[900],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Monto total: ${pedido.total}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Constants.rojo1,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0)),
                      color: Colors.green[600],
                      child: Text(
                        "Finalizar Reserva",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () async {
                        if (pedido.estado == 'RESERVADO') {
                          pedidoService
                              .updateStatus(widget.pedidoId)
                              .then((value) => {
                                    animated_dialog_box.showCustomAlertBox(
                                      context: context,
                                      firstButton: MaterialButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        color: Colors.green,
                                        child: Text('Ok'),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (BuildContext context) {
                                                return Home();
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                      yourWidget: Container(
                                        child: Text('Se realizó con exito'),
                                      ),
                                    )
                                  })
                              .catchError((onError) => {});
                        } else {}
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Constants.rojo3,
              ),
            );
          }
        },
      ),
    );
  }
}
