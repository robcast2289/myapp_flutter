// To parse this JSON data, do
//
//     final detalleLogin = detalleLoginFromJson(jsonString);

import 'dart:convert';

DetalleLogin detalleLoginFromJson(String str) =>
    DetalleLogin.fromJson(json.decode(str));

String detalleLoginToJson(DetalleLogin data) => json.encode(data.toJson());

class DetalleLogin {
  List<Detalle> detalle;
  List<Horario> horario;
  List<Personal> personal;
  List<dynamic> personalExterno;
  List<Galeria> galeria;
  List<Agenda> agenda;
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
        detalle:
            List<Detalle>.from(json["Detalle"].map((x) => Detalle.fromJson(x))),
        horario:
            List<Horario>.from(json["Horario"].map((x) => Horario.fromJson(x))),
        personal: List<Personal>.from(
            json["Personal"].map((x) => Personal.fromJson(x))),
        personalExterno:
            List<dynamic>.from(json["PersonalExterno"].map((x) => x)),
        galeria:
            List<Galeria>.from(json["Galeria"].map((x) => Galeria.fromJson(x))),
        agenda:
            List<Agenda>.from(json["Agenda"].map((x) => Agenda.fromJson(x))),
        actividadesxSemana:
            ActividadesxSemana.fromJson(json["ActividadesxSemana"]),
      );

  Map<String, dynamic> toJson() => {
        "Detalle": List<dynamic>.from(detalle.map((x) => x.toJson())),
        "Horario": List<dynamic>.from(horario.map((x) => x.toJson())),
        "Personal": List<dynamic>.from(personal.map((x) => x.toJson())),
        "PersonalExterno": List<dynamic>.from(personalExterno.map((x) => x)),
        "Galeria": List<dynamic>.from(galeria.map((x) => x.toJson())),
        "Agenda": List<dynamic>.from(agenda.map((x) => x.toJson())),
        "ActividadesxSemana": actividadesxSemana.toJson(),
      };
}

class ActividadesxSemana {
  List<dynamic> actividades;

  ActividadesxSemana({
    required this.actividades,
  });

  factory ActividadesxSemana.fromJson(Map<String, dynamic> json) =>
      ActividadesxSemana(
        actividades: List<dynamic>.from(json["Actividades"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Actividades": List<dynamic>.from(actividades.map((x) => x)),
      };
}

class Agenda {
  String actividad;
  String descripcion;
  String categoria;
  DateTime horaini;
  DateTime horafin;
  DateTime fechaActividad;
  String torre;
  String? salon;
  String track;
  String titulo;
  dynamic fechaIni;
  dynamic fechaFin;
  dynamic dia;
  String rangohora;
  String color;
  dynamic fechaEncuesta;
  DateTime horainiStr;
  DateTime horafinStr;
  int mesFecha;
  int aoFecha;
  int diaSemana;
  int semanaMes;

  Agenda({
    required this.actividad,
    required this.descripcion,
    required this.categoria,
    required this.horaini,
    required this.horafin,
    required this.fechaActividad,
    required this.torre,
    required this.salon,
    required this.track,
    required this.titulo,
    required this.fechaIni,
    required this.fechaFin,
    required this.dia,
    required this.rangohora,
    required this.color,
    required this.fechaEncuesta,
    required this.horainiStr,
    required this.horafinStr,
    required this.mesFecha,
    required this.aoFecha,
    required this.diaSemana,
    required this.semanaMes,
  });

  factory Agenda.fromRawJson(String str) => Agenda.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Agenda.fromJson(Map<String, dynamic> json) => Agenda(
        actividad: json["Actividad"],
        descripcion: json["Descripcion"],
        categoria: json["Categoria"],
        horaini: DateTime.parse(json["Horaini"]),
        horafin: DateTime.parse(json["Horafin"]),
        fechaActividad: DateTime.parse(json["Fecha_Actividad"]),
        torre: json["Torre"]!,
        salon: json["Salon"],
        track: json["Track"]!,
        titulo: json["Titulo"],
        fechaIni: json["Fecha_Ini"],
        fechaFin: json["Fecha_Fin"],
        dia: json["Dia"],
        rangohora: json["Rangohora"],
        color: json["Color"]!,
        fechaEncuesta: json["Fecha_Encuesta"],
        horainiStr: DateTime.parse(json["HorainiStr"]),
        horafinStr: DateTime.parse(json["HorafinStr"]),
        mesFecha: json["MesFecha"],
        aoFecha: json["AñoFecha"],
        diaSemana: json["DiaSemana"],
        semanaMes: json["SemanaMes"],
      );

  Map<String, dynamic> toJson() => {
        "Actividad": actividad,
        "Descripcion": descripcion,
        "Categoria": categoria,
        "Horaini": horaini.toIso8601String(),
        "Horafin": horafin.toIso8601String(),
        "Fecha_Actividad": fechaActividad.toIso8601String(),
        "Torre": torre,
        "Salon": salon,
        "Track": track,
        "Titulo": titulo,
        "Fecha_Ini": fechaIni,
        "Fecha_Fin": fechaFin,
        "Dia": dia,
        "Rangohora": rangohora,
        "Color": color,
        "Fecha_Encuesta": fechaEncuesta,
        "HorainiStr": horainiStr.toIso8601String(),
        "HorafinStr": horafinStr.toIso8601String(),
        "MesFecha": mesFecha,
        "AñoFecha": aoFecha,
        "DiaSemana": diaSemana,
        "SemanaMes": semanaMes,
      };
}

enum ColorClass { THE_595880 }

final colorValues = EnumValues({"#595880": ColorClass.THE_595880});

enum Torre { EMPTY, H007_HILTON_GUATEMALA }

final torreValues = EnumValues({
  " - ": Torre.EMPTY,
  "H007 - HILTON GUATEMALA": Torre.H007_HILTON_GUATEMALA
});

enum Track { MODALIDAD_PRESENCIAL }

final trackValues =
    EnumValues({"Modalidad Presencial": Track.MODALIDAD_PRESENCIAL});

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

class Horario {
  String dia;
  String dianombre;
  DateTime horaini;
  DateTime horafin;
  String torre;
  String salon;
  String correlativo;

  Horario({
    required this.dia,
    required this.dianombre,
    required this.horaini,
    required this.horafin,
    required this.torre,
    required this.salon,
    required this.correlativo,
  });

  factory Horario.fromRawJson(String str) => Horario.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Horario.fromJson(Map<String, dynamic> json) => Horario(
        dia: json["Dia"],
        dianombre: json["Dianombre"],
        horaini: DateTime.parse(json["Horaini"]),
        horafin: DateTime.parse(json["Horafin"]),
        torre: json["Torre"],
        salon: json["Salon"],
        correlativo: json["Correlativo"],
      );

  Map<String, dynamic> toJson() => {
        "Dia": dia,
        "Dianombre": dianombre,
        "Horaini": horaini.toIso8601String(),
        "Horafin": horafin.toIso8601String(),
        "Torre": torre,
        "Salon": salon,
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

  get fullPathImg {
    if (foto != null) return 'https://eventos.galileo.edu${foto}';

    return 'https://i.stack.imgur.com/GNhx0.png';
  }

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

class Galeria {
  int idarchivo;
  int conteo;
  dynamic caja;
  String nombreapp;
  String nombrecat;
  String aplicacion;
  int categoria;
  String nombre;
  String usuario;
  String extension;
  DateTime fecha;
  int automatizado;
  String ruta;

  Galeria({
    required this.idarchivo,
    required this.conteo,
    required this.caja,
    required this.nombreapp,
    required this.nombrecat,
    required this.aplicacion,
    required this.categoria,
    required this.nombre,
    required this.usuario,
    required this.extension,
    required this.fecha,
    required this.automatizado,
    required this.ruta,
  });

  //factory Galeria.fromRawJson(String str) => Galeria.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  get fullPathImg {
    if (ruta != null) return 'https://eventos.galileo.edu${ruta}';

    return 'https://i.stack.imgur.com/GNhx0.png';
  }

  factory Galeria.fromJson(Map<String, dynamic> json) => Galeria(
        idarchivo: json["IDARCHIVO"],
        conteo: json["CONTEO"],
        caja: json["CAJA"],
        nombreapp: json["NOMBREAPP"],
        nombrecat: json["NOMBRECAT"],
        aplicacion: json["APLICACION"],
        categoria: json["CATEGORIA"],
        nombre: json["NOMBRE"],
        usuario: json["USUARIO"],
        extension: json["EXTENSION"],
        fecha: DateTime.parse(json["FECHA"]),
        automatizado: json["AUTOMATIZADO"],
        ruta: json["RUTA"],
      );

  Map<String, dynamic> toJson() => {
        "IDARCHIVO": idarchivo,
        "CONTEO": conteo,
        "CAJA": caja,
        "NOMBREAPP": nombreapp,
        "NOMBRECAT": nombrecat,
        "APLICACION": aplicacion,
        "CATEGORIA": categoria,
        "NOMBRE": nombre,
        "USUARIO": usuario,
        "EXTENSION": extension,
        "FECHA": fecha.toIso8601String(),
        "AUTOMATIZADO": automatizado,
        "RUTA": ruta,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
