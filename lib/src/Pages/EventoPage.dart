import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:myapp/src/CustomWidgets/EventoHead.dart';
import 'package:myapp/src/models/DetalleLoginModel.dart';
import 'package:myapp/src/models/EventosLoginModel.dart';

import '../Services/EventosServices.dart';

class eventoPage extends StatefulWidget {
  eventoPage(this.event, {Key? key}) : super(key: key);
  Eventos event;
  @override
  State<eventoPage> createState() => _eventoPageState();
}

EventosServices _eventos = new EventosServices();

class _eventoPageState extends State<eventoPage> {
  late Future<DetalleLogin> _detalleLog;

  @override
  void initState() {
    super.initState();

    //_eventosLogList = _getEventosLog();
    initializeDateFormatting('es_MX');

    _detalleLog = _eventos.cargar_detalle(widget.event.evento);
    print(_detalleLog);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            EventoHead(widget.event, true),
            SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.shopping_cart),
                      Text("AGREGAR AL CARRITO"),
                    ],
                  ),
                )),
            FutureBuilder(
              future: _detalleLog,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Card(
                            child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                children: const [
                                  Icon(Icons.watch_later),
                                  SizedBox(
                                    width: 5,
                                    height: 15,
                                  ),
                                  Text(
                                    "Horario",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            Padding(
                                padding: EdgeInsets.all(10.0),
                                child: _listHorario(context, snapshot.data?.horario ?? [])
                            ),
                          ],
                        )),
                        SizedBox(
                          height: 10.0,
                        ),
                        Card(
                            child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Icon(Icons.groups),
                                  SizedBox(
                                    width: 5,
                                    height: 15,
                                  ),
                                  Text(
                                    "Nuestro Equipo",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            Padding(
                                padding: EdgeInsets.all(10.0),
                                child: _listPersonal(context, snapshot.data?.personal ?? [])
                            ),
                          ],
                        ))
                      ],
                    ),
                  );
                } else {
                  print(snapshot.error);
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget _listHorario(BuildContext context, List<Horario> data) {
  return (ListView.builder(
    //scrollDirection: Axis.vertical,
    shrinkWrap: true,
    //physics: NeverScrollableScrollPhysics(),
    itemCount: data.length,
    itemBuilder: (context, index) {
      final schedule = data[index];
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            schedule.dianombre!,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Inicia",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(DateFormat.jm('es_US')
                        .format(DateTime.parse(schedule.horaini!))),
                    Text(
                      "Fin",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(DateFormat.jm('es_US')
                        .format(DateTime.parse(schedule.horafin!))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Salón",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(schedule.salon!),
                    Text(
                      "Torre",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(schedule.torre!)
                  ],
                )
              ],
            ),
          )
        ],
      );
    },
  ));
}

Widget _listPersonal(BuildContext context, List<Personal> data){
  return (ListView.builder(
    //scrollDirection: Axis.vertical,
    shrinkWrap: true,
    //physics: NeverScrollableScrollPhysics(),
    itemCount: data.length,
    itemBuilder: (context, index) {
      final personal = data[index];
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /*Image.network("https://eventos.galileo.edu${personal.fOTO!}",
            errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
              return Text('Your error widget...');
            },
          ),*/
          FadeInImage(
            image: NetworkImage("https://eventos.galileo.edu${personal.fOTO!}"),
            placeholder: AssetImage(
                "assets/images/placeholder.jpg"),
            imageErrorBuilder:
                (context, error, stackTrace) {
              return Image.asset(
                  'assets/images/SinPerfil.png',
                  fit: BoxFit.fitHeight);
            },
            fit: BoxFit.fitWidth,
          ),
          Text(
            personal.nombre!,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            personal.puesto!,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      );
    },
  ));
}
