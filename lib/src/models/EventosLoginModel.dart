import 'Evento.dart';

class EventosLogin {
  dynamic? categorias;
  List<Evento>? eventos;

  EventosLogin({this.categorias, this.eventos});

  EventosLogin.fromJson(Map<String, dynamic> json) {
    categorias = json['Categorias'];
    if (json['Eventos'] != null) {
      eventos = <Evento>[];
      json['Eventos'].forEach((v) {
        eventos!.add(new Evento.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Categorias'] = this.categorias;
    if (this.eventos != null) {
      data['Eventos'] = this.eventos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}