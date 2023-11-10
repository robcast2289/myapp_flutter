import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/src/Services/EventosServices.dart';
import 'package:myapp/src/models/models.dart';
import 'package:provider/provider.dart';
import 'package:myapp/src/CustomWidgets/AgendaWidget.dart';

class EventoDetail extends StatelessWidget {
  final String eventId;
  const EventoDetail({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    final eventosServices =
        Provider.of<EventosServices>(context, listen: false);

    return FutureBuilder(
      future: eventosServices.cargar_detalle(eventId),
      builder: (context, AsyncSnapshot<DetalleLogin> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            constraints: BoxConstraints(maxWidth: 300),
            height: 180,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final detEvent = snapshot.data!;

        /* return Expanded(
          child: ListView.builder(child: AgendaWidget())
        ); */

        detEvent.horario.sort((a, b) {
          return a.dia.compareTo(b.dia);
        });

        return Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          child: Column(
            children: [
              if (detEvent.detalle.isNotEmpty) ...{
                ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: detEvent.detalle!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(
                            detEvent.detalle[index].detalle,
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      );
                      //return Text("But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?");
                    }),
              },
              if (detEvent.horario.isNotEmpty) ...{
                Divider(
                  height: 5,
                  thickness: 1,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.schedule_outlined,
                      size: 18.0,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Horario",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: detEvent.horario!.length,
                    itemBuilder: (context, index) {
                      return _HorarioCard(horario: detEvent.horario[index]);
                    }),
              },
              if (detEvent.personal.isNotEmpty) ...{
                Divider(
                  height: 10,
                  thickness: 1,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.people,
                      size: 18.0,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Nuestro equipo",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 30),
                    width: double.infinity,
                    height: 280,
                    child: Swiper(
                      itemWidth: 200,
                      itemBuilder: (BuildContext context, int index) {
                        final personal = detEvent.personal[index];
                        return _CastCard(persona: personal);
                      },
                      itemCount: detEvent.personal.length,
                      viewportFraction: 0.5,
                      scale: 0.5,
                      loop: false,
                    )),
              },
              if (detEvent.galeria.isNotEmpty) ...{
                Container(
                    margin: EdgeInsets.only(bottom: 30),
                    width: double.infinity,
                    height: 280,
                    child: Swiper(
                      itemWidth: 200,
                      itemBuilder: (BuildContext context, int index) {
                        final galeria = detEvent.galeria[index];
                        return Image.network(
                          "${galeria.fullPathImg!}",
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: 10,
                      viewportFraction: 0.8,
                      scale: 0.9,
                    )),
              },
            ],
          ),
        );
      },
    );
  }
}

class _HorarioCard extends StatelessWidget {
  const _HorarioCard({
    super.key,
    required this.horario,
  });

  final Horario horario;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color.fromARGB(255, 255, 243, 216),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      horario.dianombre,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Inicio: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(DateFormat('HH:mm').format(DateTime.parse(horario
                          .horaini
                          .add(const Duration(hours: -6))
                          .toString()))),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      Text(
                        "Salón: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(horario.salon),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Fin: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(DateFormat('HH:mm').format(DateTime.parse(horario
                          .horafin
                          .add(const Duration(hours: -6))
                          .toString()))),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      Text(
                        "Torre: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                      Text(horario.torre),
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  final Personal persona;

  const _CastCard({super.key, required this.persona});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      //color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/images/img_processing.gif'),
              image: NetworkImage("${persona.fullPathImg!}"),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/images/SinPerfil.png',
                    fit: BoxFit.scaleDown);
              },
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            persona.nombre,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            persona.puesto,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          )
        ],
      ),
    );
  }
}
