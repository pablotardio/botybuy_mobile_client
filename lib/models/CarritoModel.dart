class ProductoCarrito {
  int id;
  String nombre;
  Null descripcion;
  int precio;
  int cantidad;
  int tiendaId;
  DetalleOrden detalleOrden;
  List<ImagenProductos> imagenProductos;

  ProductoCarrito(
      {this.id,
      this.nombre,
      this.descripcion,
      this.precio,
      this.cantidad,
      this.tiendaId,
      this.detalleOrden,
      this.imagenProductos});

  ProductoCarrito.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    precio = json['precio'];
    cantidad = json['cantidad'];
    tiendaId = json['tiendaId'];
    detalleOrden = json['detalleOrden'] != null
        ? new DetalleOrden.fromJson(json['detalleOrden'])
        : null;
    if (json['imagenProductos'] != null) {
      imagenProductos = new List<ImagenProductos>();
      json['imagenProductos'].forEach((v) {
        imagenProductos.add(new ImagenProductos.fromJson(v));
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
    if (this.detalleOrden != null) {
      data['detalleOrden'] = this.detalleOrden.toJson();
    }
    if (this.imagenProductos != null) {
      data['imagenProductos'] =
          this.imagenProductos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DetalleOrden {
  int precioUnitario;
  int cantidad;
  String createdAt;
  String updatedAt;
  int ordenId;
  int productoId;

  DetalleOrden(
      {this.precioUnitario,
      this.cantidad,
      this.createdAt,
      this.updatedAt,
      this.ordenId,
      this.productoId});

  DetalleOrden.fromJson(Map<String, dynamic> json) {
    precioUnitario = json['precioUnitario'];
    cantidad = json['cantidad'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    ordenId = json['ordenId'];
    productoId = json['productoId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['precioUnitario'] = this.precioUnitario;
    data['cantidad'] = this.cantidad;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['ordenId'] = this.ordenId;
    data['productoId'] = this.productoId;
    return data;
  }
}

class ImagenProductos {
  int id;
  String url;
  String cloudId;
  int productoId;

  ImagenProductos({this.id, this.url, this.cloudId, this.productoId});

  ImagenProductos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    cloudId = json['cloudId'];
    productoId = json['productoId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['cloudId'] = this.cloudId;
    data['productoId'] = this.productoId;
    return data;
  }
}
