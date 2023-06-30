import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/src/models/EventosLoginModel.dart';

import '../models/models.dart';

class EventoHead extends StatelessWidget {
  EventoHead(this.event, this._detalle, {Key? key}) : super(key: key);
  Evento event;
  bool _detalle;
  @override
  Widget build(BuildContext context) {
    final numFormat = NumberFormat.currency(locale: "es-MX",symbol: "Q",decimalDigits: 2);
    final dateFormat = DateFormat("dd/MM/yyyy");
    // TODO: implement build
    return Column(
      children: [
        if(_detalle)...{
          Text(event.descripcion!, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                  placeholder: AssetImage('assets/images/no-image.jpg'), 
                  image: NetworkImage("${event.fullPathImg!}"),              
                  fit: BoxFit.cover,                 
              ),
          ),
        }else...{
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Hero(
                tag: event.evento!,
                child: FadeInImage(
                    placeholder: AssetImage('assets/images/img_processing.gif'), 
                    image: NetworkImage("${event.fullPathImg!}"),              
                    fit: BoxFit.cover,
                    
                ),
              ),
          ),
          Text(event.descripcion!, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        },
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("inicia: "),
                Text(
                  DateFormat('dd/MM/yyyy').format(DateTime.parse(event.fechaini!)),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("finaliza: "),
                Text(
                  dateFormat.format(DateTime.parse(event.fechafin!)),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        if(event.finasignacion != null)...{
        Row(
          children: [
            Icon(Icons.event,size: 15.0,),
            SizedBox(width: 5,),
            Text("Último día par asignarse: "),
            Text(
              dateFormat.format(DateTime.parse(event.finasignacion!)),
              style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),
            )
          ],
        ),
        },
        Row(
          children: [
            (_detalle ?
              Text("Inversión: "):
              Icon(Icons.credit_card,size: 15.0,)
            ),
            SizedBox(width: 5,),
            Text(numFormat.format(double.parse(event.precio!)),style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        )
      ],
    );
  }
}
