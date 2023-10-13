import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/src/CustomWidgets/eventoDetail.dart';

import '../models/models.dart';

class eventoPage extends StatelessWidget {
  eventoPage({Key? key}) : super(key: key);
  
  late Future<DetalleLogin> _detalleLog;

  /* @override
  void initState() {
    super.initState();

    //_eventosLogList = _getEventosLog();
    initializeDateFormatting('es_MX');

    _detalleLog = _eventos.cargar_detalle(widget.event.evento);
    print(_detalleLog);
  } */

  @override
  Widget build(BuildContext context) {

    final Evento event = ModalRoute.of(context)!.settings.arguments as Evento;

    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(event: event),
          /* SliverLayoutBuilder(builder: (BuildContext context, constraints){
            final scrolled = constraints.scrollOffset > 0;
            var colorDeg = Color.fromARGB(255, 255, 255, 255);

            var percent = 1 - (constraints.scrollOffset < 50 ? constraints.scrollOffset / 50 : 1);
            const fromcr = 0;
            const fromcg = 151;
            const fromcb = 152;
            var cr = 255 * percent;
            var cg = (255 - 151) * percent;
            var cb = (255 - 152) * percent;

            colorDeg = Color.fromARGB(255, (fromcr+cr).toInt(), (fromcg+cg).toInt(), (fromcb+cb).toInt());

            return
          SliverAppBar(
            primary: true,
            //backgroundColor: Color.fromARGB(255, 0, 151, 152),
            //backgroundColor: scrolled ? Color.fromARGB(255, 255, 255, 255) :  Color.fromARGB(255, 0, 151, 152),
            backgroundColor: colorDeg,
            expandedHeight: 100,
            elevation: 0.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: EdgeInsets.all(0),
              title: Container(
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(top: 30, bottom: 20, left: 40, right: 10),
                //color: Colors.black12,
                child: Text(
                    event.descripcion!,
                    style: TextStyle(fontSize: 16,backgroundColor: Color.fromARGB(0, 0, 0, 0),color: Color.fromARGB(255, 0, 0, 0)),
                    textAlign: TextAlign.center,
                    maxLines:3,
                  )
              ),
            ),
          );
          }), */
          SliverList(
            delegate: SliverChildListDelegate([
              _Overview(event: event),
              EventoDetail(eventId: event.evento!)
            ]),
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final Evento event;

  const _CustomAppBar({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(builder: (BuildContext context, constraints){
            final scrolled = constraints.scrollOffset > 0;

            var percent = 1 - (constraints.scrollOffset < 145 ? constraints.scrollOffset / 145 : 1);

            var cr = 255 * percent;
            var cg = (255 - 151) * percent;
            var cb = (255 - 152) * percent;

            var colorDeg = Color.fromARGB(255, (0+cr).toInt(), (151+cg).toInt(), (152+cb).toInt());

            return
      SliverAppBar(
        //automaticallyImplyLeading: false,
        //primary: false,
        //backgroundColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: colorDeg,
        expandedHeight: 200,
        elevation: 0.0,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          centerTitle: true,
          titlePadding: EdgeInsets.all(0),
          title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 15, left: percent == 1 ? 10 : 40, right: 10),
            color: Color.fromARGB((100*percent).toInt(), 0, 0, 0),
            child: Text(
                event.descripcion!,
                style: TextStyle(fontSize: 16,backgroundColor: Color.fromARGB(0, 0, 0, 0)),
                textAlign: TextAlign.center,
                maxLines: percent == 0 ? 2 : 4,
              )
          ),
          background: 
              Hero(              
                tag: event.evento!,
                child: FadeInImage(
                  //height: 150,
                  placeholder: AssetImage('assets/images/loading.gif'),
                  image: NetworkImage(event.fullPathImg),
                  fit: BoxFit.cover,
                ),
              ),
        ),
      );
  });
  }
}

class _Overview extends StatelessWidget {
  
  final Evento event;

  const _Overview({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _startEndDate(title: "Fecha de inicio", date: event.fechaini!, width: 140,),
              _startEndDate(title: "Fecha de finalización", date: event.fechafin!, width: 140,),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(event.finasignacion != null)...{
              _startEndDate(title: "Ultimo dia para asignarse", date: event.finasignacion!, width: 290,),
              }
            ],
          )
        ],
      ),
      
    );
  }
}

class _startEndDate extends StatelessWidget {
  final String title;
  final String date;
  final double width;
  const _startEndDate({super.key, required this.title, required this.date, required this.width});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 10,right: 10),
                color: Color.fromARGB(136, 173, 173, 173),
                child: Column(
                 children:[ 
                  Text(title),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [              
                      Text(DateFormat('dd').format(DateTime.parse(date)),
                      style: TextStyle(fontSize: 42,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 151, 152)),),
                      Column(
                        children: [
                          Text(DateFormat('MMM').format(DateTime.parse(date)),
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 151, 152)), ),
                          Text(DateFormat('yyyy').format(DateTime.parse(date)))
                        ],                
                      ),              
                    ],
                  ),
                 ]
                ),
              ),
            ),
    );
  }
}


/*
Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            EventoHead(event, true),
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
*/

/*Widget _listHorario(BuildContext context, List<Horario> data) {
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
}*/
