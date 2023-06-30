import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myapp/src/CustomWidgets/widgets.dart';

import '../models/models.dart';

class CardList extends StatelessWidget {
  
  
  final List<Evento> eventos;
  
  const CardList({super.key, required this.eventos});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if(this.eventos.length == 0){
      return Container(
        width: size.width,
        height: size.height,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: eventos.length,
          itemBuilder: (context,index) {
            final event = eventos[index];
            return Slidable(
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    backgroundColor: Color(0xff009798),
                    icon: Icons.shopping_cart,
                    label: "AGREGAR",
                    onPressed: (context){},

                  )
                ],
              ),
              child: Card(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context,'evento',arguments: event),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: EventoHead(event,false),
                  ),
                ),
              ),
            );
          }
      )
    );
  }
}