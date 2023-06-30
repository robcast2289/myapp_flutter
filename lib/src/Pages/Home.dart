import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myapp/src/CustomWidgets/EventoHead.dart';
import 'package:myapp/src/CustomWidgets/MyDrawer.dart';
import 'package:myapp/src/Pages/EventoPage.dart';
import 'package:myapp/src/Services/EventosServices.dart';
import 'package:myapp/src/models/EventosLoginModel.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../CustomWidgets/widgets.dart';

class HomePage extends StatelessWidget {

  

  //EventosServices _eventos = new EventosServices();
  //late Future<EventosLogin> _eventosLogList;

  /*@override
  void initState() {
    super.initState();

    //_eventosLogList = _getEventosLog();
    print("antes");
    _eventosLogList = _eventos.cargar_eventos();
  }

  @override
  void dispose() {
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {

    final _eventos = Provider.of<EventosServices>(context);

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Próximos Eventos'),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardList(eventos: _eventos.onDisplayEvents,),
            ],
          ),
        ),
        
        /* FutureBuilder(
          future: _eventosLogList,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              print(snapshot.data);
              /*return ListView(
                children: _listEventos(snapshot.data?.eventos ?? []),
              );*/
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: _listEventos(context, snapshot.data?.eventos ?? []),
              );
            }
            else{
              print(snapshot.error);
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ), */
      drawer: MyDrawer(),
    );
  }
}

/* Widget _listEventos(BuildContext context, List<Eventos> data){
  return (
      ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,index) {
            final event = data[index];
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
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>eventoPage(event))
                    );
                  },
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
} */