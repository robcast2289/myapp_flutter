import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/Services/EventosServices.dart';
import 'package:myapp/src/models/models.dart';
import 'package:provider/provider.dart';

class EventoDetail extends StatelessWidget {
  final String eventId;
  const EventoDetail({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    final eventosServices = Provider.of<EventosServices>(context,listen: false);
    return FutureBuilder(
      future: eventosServices.cargar_detalle(eventId),
      builder:(context,AsyncSnapshot<DetalleLogin> snapshot) {
        if(!snapshot.hasData){
          return Container(
            constraints: BoxConstraints(maxWidth: 300),
            height: 180,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final detEvent = snapshot.data!;

        return Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          child: Column(
            children: [
              if(detEvent.detalle.length > 0)...{
              ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: detEvent.detalle!.length,
                itemBuilder: (context, index) {                  
                    //return Text(detEvent.detalle[index].detalle);
                    return Text("But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?");
                  }                
                ),
              },
              if(detEvent.personal.length > 0)...{
                Swiper(
                  itemCount: detEvent.personal.length,
                  itemWidth: 300,
                  itemHeight: 200,
                  loop: false,
                  layout: SwiperLayout.STACK,
                  itemBuilder: (context, index) {
                    final personal = detEvent.personal[index];
                    return FadeInImage(
                      placeholder: AssetImage('assets/imagenes/no-image.jpg'), 
                      image: AssetImage('assets/imagenes/no-image.jpg')
                    );
                  },
                )
              }
            ],
          ),
        );
      },
    );
  }
}