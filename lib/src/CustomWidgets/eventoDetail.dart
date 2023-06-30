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
                    return Text(detEvent.detalle[index].detalle);
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