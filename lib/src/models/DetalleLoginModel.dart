class DetalleLogin {
  //List<Null>? detalle;
  List<Horario>? horario;
  List<Personal>? personal;
  /*List<Null>? personalExterno;
  List<Null>? galeria;
  List<Null>? agenda;*/
  ActividadesxSemana? actividadesxSemana;

  DetalleLogin(
      {//this.detalle,
        this.horario,
        this.personal,
        /*this.personalExterno,
        this.galeria,
        this.agenda,
        this.actividadesxSemana*/});

  DetalleLogin.fromJson(Map<String, dynamic> json) {
    /*if (json['Detalle'] != null) {
      detalle = <Null>[];
      json['Detalle'].forEach((v) {
        detalle!.add(new Null.fromJson(v));
      });
    }*/
    if (json['Horario'] != null) {
      horario = <Horario>[];
      json['Horario'].forEach((v) {
        horario!.add(new Horario.fromJson(v));
      });
    }
    if (json['Personal'] != null) {
      personal = <Personal>[];
      json['Personal'].forEach((v) {
        personal!.add(new Personal.fromJson(v));
      });
    }
    /*if (json['PersonalExterno'] != null) {
      personalExterno = <Null>[];
      json['PersonalExterno'].forEach((v) {
        personalExterno!.add(new Null.fromJson(v));
      });
    }
    if (json['Galeria'] != null) {
      galeria = <Null>[];
      json['Galeria'].forEach((v) {
        galeria!.add(new Null.fromJson(v));
      });
    }
    if (json['Agenda'] != null) {
      agenda = <Null>[];
      json['Agenda'].forEach((v) {
        agenda!.add(new Null.fromJson(v));
      });
    }
    actividadesxSemana = json['ActividadesxSemana'] != null
        ? new ActividadesxSemana.fromJson(json['ActividadesxSemana'])
        : null;*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    /*if (this.detalle != null) {
      data['Detalle'] = this.detalle!.map((v) => v.toJson()).toList();
    }*/
    if (this.horario != null) {
      data['Horario'] = this.horario!.map((v) => v.toJson()).toList();
    }
    if (this.personal != null) {
      data['Personal'] = this.personal!.map((v) => v.toJson()).toList();
    }
    /*if (this.personalExterno != null) {
      data['PersonalExterno'] =
          this.personalExterno!.map((v) => v.toJson()).toList();
    }
    if (this.galeria != null) {
      data['Galeria'] = this.galeria!.map((v) => v.toJson()).toList();
    }
    if (this.agenda != null) {
      data['Agenda'] = this.agenda!.map((v) => v.toJson()).toList();
    }
    if (this.actividadesxSemana != null) {
      data['ActividadesxSemana'] = this.actividadesxSemana!.toJson();
    }*/
    return data;
  }
}

class Horario {
  String? dia;
  String? dianombre;
  String? horaini;
  String? horafin;
  String? torre;
  String? salon;
  String? correlativo;

  Horario(
      {this.dia,
        this.dianombre,
        this.horaini,
        this.horafin,
        this.torre,
        this.salon,
        this.correlativo});

  Horario.fromJson(Map<String, dynamic> json) {
    dia = json['Dia'];
    dianombre = json['Dianombre'];
    horaini = json['Horaini'];
    horafin = json['Horafin'];
    torre = json['Torre'];
    salon = json['Salon'];
    correlativo = json['Correlativo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Dia'] = this.dia;
    data['Dianombre'] = this.dianombre;
    data['Horaini'] = this.horaini;
    data['Horafin'] = this.horafin;
    data['Torre'] = this.torre;
    data['Salon'] = this.salon;
    data['Correlativo'] = this.correlativo;
    return data;
  }
}

class Personal {
  String? nombre;
  String? puesto;
  String? correlativo;
  String? fOTO;

  Personal({this.nombre, this.puesto, this.correlativo, this.fOTO});

  Personal.fromJson(Map<String, dynamic> json) {
    nombre = json['Nombre'];
    puesto = json['Puesto'];
    correlativo = json['Correlativo'];
    fOTO = json['FOTO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nombre'] = this.nombre;
    data['Puesto'] = this.puesto;
    data['Correlativo'] = this.correlativo;
    data['FOTO'] = this.fOTO;
    return data;
  }
}

class ActividadesxSemana {
  List<Null>? actividades;

  ActividadesxSemana({this.actividades});

  ActividadesxSemana.fromJson(Map<String, dynamic> json) {
    /*if (json['Actividades'] != null) {
      actividades = <Null>[];
      json['Actividades'].forEach((v) {
        actividades!.add(new Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    /*if (this.actividades != null) {
      data['Actividades'] = this.actividades!.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}