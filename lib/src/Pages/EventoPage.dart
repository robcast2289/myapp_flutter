import 'package:flutter/cupertino.dart';
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
        _AddToCartButtom(),
        SliverList(
          delegate: SliverChildListDelegate(
              [_Overview(event: event), EventoDetail(eventId: event.evento!)]),
        )
      ],
    ));
  }
}

class _AddToCartButtom extends StatelessWidget {
  const _AddToCartButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color.fromARGB(144, 255, 255, 255),
      elevation: 1.0,
      floating: false,
      pinned: true,
      primary: false,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        centerTitle: true,
        titlePadding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        title: FilledButton(
          style: FilledButton.styleFrom(
              foregroundColor: Color.fromARGB(255, 255, 255, 255),
              backgroundColor: Color.fromARGB(255, 199, 100, 20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.add_shopping_cart,
                size: 20.0,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'AGREGAR AL CARRITO',
              ),
            ],
          ),
          onPressed: () {
            // ...
            showGeneralDialog(
              barrierDismissible: true,
              barrierLabel: "Sign In",
              context: context,
              pageBuilder: (context, _, __) => Center(
                child: Container(
                  height: 620,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                  decoration: BoxDecoration(
                      color:
                          //Color.fromARGB(255, 216, 218, 255).withOpacity(0.94),
                          Color.fromARGB(255, 255, 255, 255).withOpacity(0.94),
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Column(
                        children: const [
                          Text(
                            "Iniciar Sesión",
                            style:
                                TextStyle(fontSize: 34, fontFamily: "Poppins"),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              "Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and swift.",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SignInForm()
                        ],
                      )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 25),
          child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF77D8E),
                  minimumSize: Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ))),
              icon: Icon(CupertinoIcons.arrow_right),
              label: Text("Inica sesión")),
        )
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final Evento event;

  const _CustomAppBar({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(builder: (BuildContext context, constraints) {
      final scrolled = constraints.scrollOffset > 0;

      var percent = 1 -
          (constraints.scrollOffset < 145 ? constraints.scrollOffset / 145 : 1);

      var cr = 255 * percent;
      var cg = (255 - 151) * percent;
      var cb = (255 - 152) * percent;

      var colorDeg = Color.fromARGB(
          255, (0 + cr).toInt(), (151 + cg).toInt(), (152 + cb).toInt());

      return SliverAppBar(
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
              padding: EdgeInsets.only(
                  bottom: 15, left: percent == 1 ? 10 : 40, right: 10),
              color: Color.fromARGB((100 * percent).toInt(), 0, 0, 0),
              child: Text(
                event.descripcion!,
                style: TextStyle(
                    fontSize: 16, backgroundColor: Color.fromARGB(0, 0, 0, 0)),
                textAlign: TextAlign.center,
                maxLines: percent == 0 ? 2 : 4,
              )),
          background: Hero(
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
              _startEndDate(
                title: "Fecha de inicio",
                date: event.fechaini!,
                width: 140,
              ),
              _startEndDate(
                title: "Fecha de finalización",
                date: event.fechafin!,
                width: 140,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (event.finasignacion != null) ...{
                _startEndDate(
                  title: "Ultimo dia para asignarse",
                  date: event.finasignacion!,
                  width: 290,
                ),
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
  const _startEndDate(
      {super.key,
      required this.title,
      required this.date,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 10, right: 10),
          color: Color.fromARGB(136, 173, 173, 173),
          child: Column(children: [
            Text(title),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /* Icon(
                  Icons.calendar_month_outlined,
                ), */
                Text(
                  DateFormat('dd').format(DateTime.parse(date)),
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 151, 152)),
                ),
                Column(
                  children: [
                    Text(
                      DateFormat('MMM').format(DateTime.parse(date)),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 151, 152)),
                    ),
                    Text(DateFormat('yyyy').format(DateTime.parse(date)))
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
