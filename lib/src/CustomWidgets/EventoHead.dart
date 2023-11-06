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
        SizedBox(height: 5,),
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
        SizedBox(height: 8,),
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
        SizedBox(height: 5,),
        if(event.diploma == "1")...{
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
                  color: Colors.amber
                ),
                padding: EdgeInsets.only(top: 6,bottom: 5,left: 8,right: 3),
                child: Icon(Icons.description,size: 15.0,)
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(right: Radius.circular(8)),
                  color: Colors.amber
                ),
                padding: EdgeInsets.only(top: 5,bottom: 5,right: 15),
                child: Text("Inlcuye diploma"),
              )
            ],
          )
        },
        SizedBox(height: 5,),
        if(event.pagos != null && int.parse(event.pagos!) > 1)...{
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
                  color: Colors.blueGrey
                ),
                padding: EdgeInsets.only(top: 6,bottom: 5,left: 8,right: 3),
                child: Icon(Icons.payments,size: 15.0,color: Colors.white,)
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(right: Radius.circular(8)),
                  color: Colors.blueGrey
                ),
                padding: EdgeInsets.only(top: 5,bottom: 5,right: 15),
                child: Text("Hasta en ${event.pagos!} pagos",style: TextStyle(color: Colors.white),),
              )
            ],
          )
        },
        SizedBox(height: 5,),
        Row(
          children: [
            (_detalle ?
              Text("Inversión: "):
              Icon(Icons.credit_card,size: 15.0,)
            ),
            SizedBox(width: 5,),
            Row(
              children: [                
                Text(numFormat.format(double.parse(event.precio!)),style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            )
          ],
        )
      ],
    );
  }
}
