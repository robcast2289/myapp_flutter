import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/src/models/DetalleLoginModel.dart';
import 'package:myapp/src/models/Evento.dart';

import '../models/EventosLoginModel.dart';
import 'package:http/http.dart' as http;

class EventosServices extends ChangeNotifier{

  final String _baseUrl = 'https://eventos.galileo.edu/api/';

  List<Evento> onDisplayEvents = [];

  EventosServices(){
    getOnDisplayEvents();
  }

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

  Future<String> _getJsonData(String endpoint) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayEvents() async{
    final response = await _getJsonData('eventoslogin');
    final nowEventsResponse = EventosLogin.fromJson(jsonDecode(response));
    onDisplayEvents = nowEventsResponse.eventos!;
    notifyListeners();
  }

}