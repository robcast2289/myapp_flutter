// To parse this JSON data, do
//
//     final detalleLogin = detalleLoginFromJson(jsonString);

import 'dart:convert';

DetalleLogin detalleLoginFromJson(String str) => DetalleLogin.fromJson(json.decode(str));

String detalleLoginToJson(DetalleLogin data) => json.encode(data.toJson());

class DetalleLogin {
    List<Detalle> detalle;
    List<dynamic> horario;
    List<Personal> personal;
    List<dynamic> personalExterno;
    List<dynamic> galeria;
    List<dynamic> agenda;
    ActividadesxSemana actividadesxSemana;

    DetalleLogin({
        required this.detalle,
        required this.horario,
        required this.personal,
        required this.personalExterno,
        required this.galeria,
        required this.agenda,
        required this.actividadesxSemana,
    });

    factory DetalleLogin.fromJson(Map<String, dynamic> json) => DetalleLogin(
        detalle: List<Detalle>.from(json["Detalle"].map((x) => Detalle.fromJson(x))),
        horario: List<dynamic>.from(json["Horario"].map((x) => x)),
        personal: List<Personal>.from(json["Personal"].map((x) => Personal.fromJson(x))),
        personalExterno: List<dynamic>.from(json["PersonalExterno"].map((x) => x)),
        galeria: List<dynamic>.from(json["Galeria"].map((x) => x)),
        agenda: List<dynamic>.from(json["Agenda"].map((x) => x)),
        actividadesxSemana: ActividadesxSemana.fromJson(json["ActividadesxSemana"]),
    );

    Map<String, dynamic> toJson() => {
        "Detalle": List<dynamic>.from(detalle.map((x) => x.toJson())),
        "Horario": List<dynamic>.from(horario.map((x) => x)),
        "Personal": List<dynamic>.from(personal.map((x) => x.toJson())),
        "PersonalExterno": List<dynamic>.from(personalExterno.map((x) => x)),
        "Galeria": List<dynamic>.from(galeria.map((x) => x)),
        "Agenda": List<dynamic>.from(agenda.map((x) => x)),
        "ActividadesxSemana": actividadesxSemana.toJson(),
    };
}

class ActividadesxSemana {
    List<dynamic> actividades;

    ActividadesxSemana({
        required this.actividades,
    });

    factory ActividadesxSemana.fromJson(Map<String, dynamic> json) => ActividadesxSemana(
        actividades: List<dynamic>.from(json["Actividades"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Actividades": List<dynamic>.from(actividades.map((x) => x)),
    };
}

class Detalle {
    String evento;
    String detalle;
    String correlativo;

    Detalle({
        required this.evento,
        required this.detalle,
        required this.correlativo,
    });

    factory Detalle.fromJson(Map<String, dynamic> json) => Detalle(
        evento: json["Evento"],
        detalle: json["Detalle"],
        correlativo: json["Correlativo"],
    );

    Map<String, dynamic> toJson() => {
        "Evento": evento,
        "Detalle": detalle,
        "Correlativo": correlativo,
    };
}

class Personal {
    String nombre;
    String puesto;
    String correlativo;
    String foto;

    Personal({
        required this.nombre,
        required this.puesto,
        required this.correlativo,
        required this.foto,
    });

    factory Personal.fromJson(Map<String, dynamic> json) => Personal(
        nombre: json["Nombre"],
        puesto: json["Puesto"],
        correlativo: json["Correlativo"],
        foto: json["FOTO"],
    );

    Map<String, dynamic> toJson() => {
        "Nombre": nombre,
        "Puesto": puesto,
        "Correlativo": correlativo,
        "FOTO": foto,
    };
}
