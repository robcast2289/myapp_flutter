import 'dart:convert';

import 'package:myapp/src/models/DetalleLoginModel.dart';

import '../models/EventosLoginModel.dart';
import 'package:http/http.dart' as http;

class EventosServices{
    Future<EventosLogin> cargar_eventos() async {
      try {
        final response = await http.get(
            Uri.parse("https://eventos.galileo.edu/api/eventoslogin"));

        if (response.statusCode == 200) {
          String body = utf8.decode(response.bodyBytes);
          final jsonData = jsonDecode(body);
          print(jsonData);
          return EventosLogin.fromJson(jsonData);
        }
        else {
          throw Exception("Fallo la conexion");
        }
      } catch(e){
        print("Error: ${e.toString()}");
        return EventosLogin();
      }
    }

    Future<DetalleLogin> cargar_detalle(id_evento) async {
      print("https://eventos.galileo.edu/api/detallelogin/$id_evento");
      final response = await http.get(Uri.parse("https://eventos.galileo.edu/api/detallelogin/$id_evento"));

      if(response.statusCode == 200){
        String body = utf8.decode(response.bodyBytes);
        final jsonData = jsonDecode(body);
        return DetalleLogin.fromJson(jsonData);
      }
      else{
        throw Exception("Falló la conexión");
      }
    }

}