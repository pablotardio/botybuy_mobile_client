class UsuarioModel {
  int id;
  String correo;
  String clave;
  String nombre;
  String celular;
  String fechaNac;
  int rolId;

  UsuarioModel(
      {this.id,
      this.correo,
      this.clave,
      this.nombre,
      this.celular,
      this.fechaNac,
      this.rolId});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    correo = json['correo'];
    clave = json['clave'];
    nombre = json['nombre'];
    celular = json['celular'];
    fechaNac = json['fechaNac'];
    rolId = json['rolId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['correo'] = this.correo;
    data['clave'] = this.clave;
    data['nombre'] = this.nombre;
    data['celular'] = this.celular;
    data['fechaNac'] = this.fechaNac;
    data['rolId'] = this.rolId;
    return data;
  }
}
