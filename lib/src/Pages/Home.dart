import 'package:flutter/material.dart';
import 'package:myapp/src/Services/EventosServices.dart';
import 'package:provider/provider.dart';
import '../CustomWidgets/widgets.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _eventos = Provider.of<EventosServices>(context);
    timeDilation = 2.5;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Próximos Eventos'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardList(
              eventos: _eventos.onDisplayEvents,
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
