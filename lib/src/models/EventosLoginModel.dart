class EventosLogin {
  Null? categorias;
  List<Eventos>? eventos;

  EventosLogin({this.categorias, this.eventos});

  EventosLogin.fromJson(Map<String, dynamic> json) {
    categorias = json['Categorias'];
    if (json['Eventos'] != null) {
      eventos = <Eventos>[];
      json['Eventos'].forEach((v) {
        eventos!.add(new Eventos.fromJson(v));
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

class Eventos {
  String? evento;
  String? carrera;
  String? descripcion;
  Null? codmovto;
  String? precio;
  String? horario;
  String? diploma;
  String? fechaini;
  String? fechafin;
  String? tituloevento;
  Null? status;
  Null? codigo;
  Null? descuento;
  Null? total;
  Null? ordendepago;
  String? categoria;
  Null? creacion;
  Null? perfil;
  String? diasinicio;
  String? estudiante;
  String? docente;
  String? administrativo;
  String? fechaasig;
  String? pagos;
  Null? nombreEmpresa;
  String? privado;
  String? inicioasignacion;
  String? finasignacion;
  String? asigtemprana;
  String? diasfaltantes;
  Null? codPerfil;
  String? tieneasignaciones;
  String? categoriaprivada;
  String? cupo;
  String? maxasignados;
  String? entidad;
  Null? asignaciones;
  Null? perfilcolor;
  String? ocultarPrecio;
  String? solicitarDiploma;
  Null? administrador;
  String? precioDiploma;
  String? cursolibre;
  String? crearCuentas;
  String? pagoinstitucional;
  Null? enlaceExterno;
  String? enfecha;
  String? asignarportrack;
  String? identificacion;
  String? precioRepodiploma;
  String? diplomaRegistrado;
  Null? vistaEstudiante;
  int? imgDefault;
  String? fotoevento;

  Eventos(
      {this.evento,
        this.carrera,
        this.descripcion,
        this.codmovto,
        this.precio,
        this.horario,
        this.diploma,
        this.fechaini,
        this.fechafin,
        this.tituloevento,
        this.status,
        this.codigo,
        this.descuento,
        this.total,
        this.ordendepago,
        this.categoria,
        this.creacion,
        this.perfil,
        this.diasinicio,
        this.estudiante,
        this.docente,
        this.administrativo,
        this.fechaasig,
        this.pagos,
        this.nombreEmpresa,
        this.privado,
        this.inicioasignacion,
        this.finasignacion,
        this.asigtemprana,
        this.diasfaltantes,
        this.codPerfil,
        this.tieneasignaciones,
        this.categoriaprivada,
        this.cupo,
        this.maxasignados,
        this.entidad,
        this.asignaciones,
        this.perfilcolor,
        this.ocultarPrecio,
        this.solicitarDiploma,
        this.administrador,
        this.precioDiploma,
        this.cursolibre,
        this.crearCuentas,
        this.pagoinstitucional,
        this.enlaceExterno,
        this.enfecha,
        this.asignarportrack,
        this.identificacion,
        this.precioRepodiploma,
        this.diplomaRegistrado,
        this.vistaEstudiante,
        this.imgDefault,
        this.fotoevento});

  Eventos.fromJson(Map<String, dynamic> json) {
    evento = json['Evento'];
    carrera = json['Carrera'];
    descripcion = json['Descripcion'];
    codmovto = json['Codmovto'];
    precio = json['Precio'];
    horario = json['Horario'];
    diploma = json['Diploma'];
    fechaini = json['Fechaini'];
    fechafin = json['Fechafin'];
    tituloevento = json['Tituloevento'];
    status = json['Status'];
    codigo = json['Codigo'];
    descuento = json['Descuento'];
    total = json['Total'];
    ordendepago = json['Ordendepago'];
    categoria = json['Categoria'];
    creacion = json['Creacion'];
    perfil = json['Perfil'];
    diasinicio = json['Diasinicio'];
    estudiante = json['Estudiante'];
    docente = json['Docente'];
    administrativo = json['Administrativo'];
    fechaasig = json['Fechaasig'];
    pagos = json['Pagos'];
    nombreEmpresa = json['Nombre_Empresa'];
    privado = json['Privado'];
    inicioasignacion = json['Inicioasignacion'];
    finasignacion = json['Finasignacion'];
    asigtemprana = json['Asigtemprana'];
    diasfaltantes = json['Diasfaltantes'];
    codPerfil = json['Cod_Perfil'];
    tieneasignaciones = json['Tieneasignaciones'];
    categoriaprivada = json['Categoriaprivada'];
    cupo = json['Cupo'];
    maxasignados = json['Maxasignados'];
    entidad = json['Entidad'];
    asignaciones = json['Asignaciones'];
    perfilcolor = json['Perfilcolor'];
    ocultarPrecio = json['Ocultar_Precio'];
    solicitarDiploma = json['Solicitar_Diploma'];
    administrador = json['Administrador'];
    precioDiploma = json['Precio_Diploma'];
    cursolibre = json['Cursolibre'];
    crearCuentas = json['Crear_Cuentas'];
    pagoinstitucional = json['Pagoinstitucional'];
    enlaceExterno = json['Enlace_Externo'];
    enfecha = json['Enfecha'];
    asignarportrack = json['Asignarportrack'];
    identificacion = json['Identificacion'];
    precioRepodiploma = json['Precio_Repodiploma'];
    diplomaRegistrado = json['Diploma_Registrado'];
    vistaEstudiante = json['Vista_Estudiante'];
    imgDefault = json['imgDefault'];
    fotoevento = json['Fotoevento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Evento'] = this.evento;
    data['Carrera'] = this.carrera;
    data['Descripcion'] = this.descripcion;
    data['Codmovto'] = this.codmovto;
    data['Precio'] = this.precio;
    data['Horario'] = this.horario;
    data['Diploma'] = this.diploma;
    data['Fechaini'] = this.fechaini;
    data['Fechafin'] = this.fechafin;
    data['Tituloevento'] = this.tituloevento;
    data['Status'] = this.status;
    data['Codigo'] = this.codigo;
    data['Descuento'] = this.descuento;
    data['Total'] = this.total;
    data['Ordendepago'] = this.ordendepago;
    data['Categoria'] = this.categoria;
    data['Creacion'] = this.creacion;
    data['Perfil'] = this.perfil;
    data['Diasinicio'] = this.diasinicio;
    data['Estudiante'] = this.estudiante;
    data['Docente'] = this.docente;
    data['Administrativo'] = this.administrativo;
    data['Fechaasig'] = this.fechaasig;
    data['Pagos'] = this.pagos;
    data['Nombre_Empresa'] = this.nombreEmpresa;
    data['Privado'] = this.privado;
    data['Inicioasignacion'] = this.inicioasignacion;
    data['Finasignacion'] = this.finasignacion;
    data['Asigtemprana'] = this.asigtemprana;
    data['Diasfaltantes'] = this.diasfaltantes;
    data['Cod_Perfil'] = this.codPerfil;
    data['Tieneasignaciones'] = this.tieneasignaciones;
    data['Categoriaprivada'] = this.categoriaprivada;
    data['Cupo'] = this.cupo;
    data['Maxasignados'] = this.maxasignados;
    data['Entidad'] = this.entidad;
    data['Asignaciones'] = this.asignaciones;
    data['Perfilcolor'] = this.perfilcolor;
    data['Ocultar_Precio'] = this.ocultarPrecio;
    data['Solicitar_Diploma'] = this.solicitarDiploma;
    data['Administrador'] = this.administrador;
    data['Precio_Diploma'] = this.precioDiploma;
    data['Cursolibre'] = this.cursolibre;
    data['Crear_Cuentas'] = this.crearCuentas;
    data['Pagoinstitucional'] = this.pagoinstitucional;
    data['Enlace_Externo'] = this.enlaceExterno;
    data['Enfecha'] = this.enfecha;
    data['Asignarportrack'] = this.asignarportrack;
    data['Identificacion'] = this.identificacion;
    data['Precio_Repodiploma'] = this.precioRepodiploma;
    data['Diploma_Registrado'] = this.diplomaRegistrado;
    data['Vista_Estudiante'] = this.vistaEstudiante;
    data['imgDefault'] = this.imgDefault;
    data['Fotoevento'] = this.fotoevento;
    return data;
  }
}