import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
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
              if (detEvent.personal.isNotEmpty) ...{
                /* Swiper(
                  layout: SwiperLayout.CUSTOM,
                  customLayoutOption: CustomLayoutOption(
                    startIndex: -1,
                    stateCount: 3
                  )..addRotate([
                    -45.0/180,
                    0.0,
                    45.0/180
                  ])..addTranslate([
                    Offset(-370.0, -40.0),
                    Offset(0.0, 0.0),
                    Offset(370.0, -40.0)
                  ]),
                  itemWidth: 300.0,
                  itemHeight: 200.0,
                  itemBuilder: (context, index) {
                    final personal = detEvent.personal[index];
                    return FadeInImage(
                        placeholder: const AssetImage('assets/images/img_processing.gif'),
                        image: NetworkImage("${personal.fullPathImg!}"),
                        imageErrorBuilder:(context, error, stackTrace) {
                          return Image.asset('assets/images/SinPerfil.png',
                              fit: BoxFit.scaleDown
                          );
                        },
                        fit: BoxFit.fitWidth,
                    );
                  },
                  //loop: false,
                  itemCount: detEvent.personal.length,
                ) */
                /* Flexible(
                  child: Swiper(
                    itemWidth: 200,
                    itemBuilder: (BuildContext context, int index) {
                      final personal = detEvent.personal[index];
                      return Image.network(
                        "${personal.fullPathImg!}",
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: detEvent.personal.length,
                    viewportFraction: 0.8,
                    scale: 0.9,
                  ),
                ) */
                ListView.builder(
                    itemCount: detEvent.personal.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) =>
                        _CastCard(persona: detEvent.personal[index]))
                /* Text(detEvent.personal.length.toString()) */
              },
              if (detEvent.galeria.isNotEmpty) ...{
                /* Swiper(
                  layout: SwiperLayout.CUSTOM,
                  customLayoutOption: CustomLayoutOption(
                    startIndex: -1,
                    stateCount: 3
                  )..addRotate([
                    -45.0/180,
                    0.0,
                    45.0/180
                  ])..addTranslate([
                    Offset(-370.0, -40.0),
                    Offset(0.0, 0.0),
                    Offset(370.0, -40.0)
                  ]),
                  itemWidth: 300.0,
                  itemHeight: 200.0,
                  itemBuilder: (context, index) {
                    final galeria = detEvent.galeria[index];
                    return FadeInImage(
                      placeholder: AssetImage('assets/images/no-image.jpg'), 
                      image: NetworkImage("${galeria.fullPathImg!}"),
                      fit: BoxFit.scaleDown,
                    );
                  },
                  itemCount: detEvent.galeria.length,
                ) */
                Swiper(
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
                )
              },
            ],
          ),
        );
      },
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
              placeholder: AssetImage('assets/images/SinPerfil.png'),
              image: NetworkImage(persona.fullPathImg),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
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
          )
        ],
      ),
    );
  }
}
