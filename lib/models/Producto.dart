class ProductoModel {
  int id;
  String nombre;
  String descripcion;
  int precio;
  int cantidad;
  int tiendaId;
  List<ImagenProductos> imagenProductos;
  List<Categoria> categoria;

  ProductoModel(
      {this.id,
      this.nombre,
      this.descripcion,
      this.precio,
      this.cantidad,
      this.tiendaId,
      this.imagenProductos,
      this.categoria});

  ProductoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    precio = json['precio'];
    cantidad = json['cantidad'];
    tiendaId = json['tiendaId'];
    if (json['imagenProductos'] != null) {
      imagenProductos = new List<ImagenProductos>();
      json['imagenProductos'].forEach((v) {
        imagenProductos.add(new ImagenProductos.fromJson(v));
      });
    }
    if (json['categoria'] != null) {
      categoria = new List<Categoria>();
      json['categoria'].forEach((v) {
        categoria.add(new Categoria.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['descripcion'] = this.descripcion;
    data['precio'] = this.precio;
    data['cantidad'] = this.cantidad;
    data['tiendaId'] = this.tiendaId;
    if (this.imagenProductos != null) {
      data['imagenProductos'] =
          this.imagenProductos.map((v) => v.toJson()).toList();
    }
    if (this.categoria != null) {
      data['categoria'] = this.categoria.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImagenProductos {
  String url;

  ImagenProductos({this.url});

  ImagenProductos.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

class Categoria {
  int id;
  String nombre;
  String descripcion;

  Categoria({this.id, this.nombre, this.descripcion});

  Categoria.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['descripcion'] = this.descripcion;
    return data;
  }
}
