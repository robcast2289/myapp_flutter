
import 'package:flutter/material.dart';
import 'package:myapp/src/Pages/EventoPage.dart';
import 'package:myapp/src/Pages/Home.dart';
import 'package:intl/intl.dart';
import 'package:myapp/src/Services/EventosServices.dart';
import 'package:provider/provider.dart';

void main() {
  Intl.defaultLocale = 'en-US';
  runApp(AppState());
}

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => EventosServices(), lazy: false,)
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  MaterialColor getMaterialColor(Color color) {
    final Map<int, Color> shades = {
      50: Color.fromRGBO(136, 14, 79, .1),
      100: Color.fromRGBO(136, 14, 79, .2),
      200: Color.fromRGBO(136, 14, 79, .3),
      300: Color.fromRGBO(136, 14, 79, .4),
      400: Color.fromRGBO(136, 14, 79, .5),
      500: Color.fromRGBO(136, 14, 79, .6),
      600: Color.fromRGBO(136, 14, 79, .7),
      700: Color.fromRGBO(136, 14, 79, .8),
      800: Color.fromRGBO(136, 14, 79, .9),
      900: Color.fromRGBO(136, 14, 79, 1),
    };
    return MaterialColor(color.value, shades);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home':(context) => HomePage(),
        'evento':(context) => eventoPage()
      },
      theme: ThemeData.light().copyWith(
        //primarySwatch: getMaterialColor(Color(0xff009798))
        appBarTheme: AppBarTheme(
          color: getMaterialColor(Color(0xff009798)),
        )
      ),
      //home: HomePage()
    );
  }
}

