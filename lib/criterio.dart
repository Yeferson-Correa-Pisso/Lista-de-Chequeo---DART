const String estadoCumple = 'Cumple';
const String estadoNoCumple = 'No cumple';
const String estadoEnRevision = 'En revisión';

class Criterio {
  int id;
  String descripcion;
  String estado;
  String observacion;

  Criterio(
    this.id,
    this.descripcion, {
    this.estado = estadoEnRevision,
    this.observacion = '',
  });

  void cambiarEstado(String nuevoEstado) {
    if (nuevoEstado == estadoCumple ||
        nuevoEstado == estadoNoCumple ||
        nuevoEstado == estadoEnRevision) {
      estado = nuevoEstado;
    } else {
      throw ArgumentError('Estado no válido: "$nuevoEstado"');
    }
  }

  void registrarObservacion(String texto) {
    observacion = texto;
  }

  bool cumple() {
    return estado == estadoCumple;
  }

  bool noCumple() {
    return estado == estadoNoCumple;
  }

  bool requiereRevision() {
    return estado == estadoEnRevision;
  }

  void mostrarInformacion() {
    print('[$id] $descripcion');
    print('     Estado: $estado');
    print('     Observación: ${observacion.isEmpty ? 'Sin observaciones' : observacion}');
  }
}
