import 'criterio.dart';

const String estadoAprobado = 'Aprobado';
const String estadoRequiereAjustes = 'Requiere ajustes';
const String estadoModeloEnRevision = 'En revisión';

String formatearPorcentaje(double valor) {
  if (valor == valor.roundToDouble()) {
    return valor.toInt().toString();
  }
  return valor.toStringAsFixed(1);
}

class ModeloAnalisis {
  int id;
  String nombre;
  String descripcion;
  List<Criterio> criterios;

  ModeloAnalisis(this.id, this.nombre, this.descripcion) : criterios = [];

  bool agregarCriterio(Criterio criterio) {
    if (buscarCriterio(criterio.id) != null) {
      print('Ya existe un criterio con id ${criterio.id} en "$nombre".');
      return false;
    }
    criterios.add(criterio);
    return true;
  }

  List<Criterio> consultarCriterios() {
    return List<Criterio>.from(criterios);
  }

  void mostrarCriterios() {
    print('Criterios de "$nombre" (${contarCriterios()}):');
    if (criterios.isEmpty) {
      print('  (sin criterios)');
      return;
    }
    for (Criterio criterio in criterios) {
      criterio.mostrarInformacion();
    }
  }

  Criterio? buscarCriterio(int idBuscado) {
    for (Criterio criterio in criterios) {
      if (criterio.id == idBuscado) {
        return criterio;
      }
    }
    return null;
  }

  int contarCriterios() {
    return criterios.length;
  }

  Map<String, int> verificarCriterios() {
    int cumplen = 0;
    int noCumplen = 0;
    int enRevision = 0;

    for (Criterio criterio in criterios) {
      if (criterio.cumple()) {
        cumplen++;
      } else if (criterio.noCumple()) {
        noCumplen++;
      } else {
        enRevision++;
      }
    }

    return {
      'cumplen': cumplen,
      'noCumplen': noCumplen,
      'enRevision': enRevision,
    };
  }

  double calcularPorcentajeCumplimiento() {
    int total = contarCriterios();
    if (total == 0) {
      return 0.0;
    }
    int cumplen = verificarCriterios()['cumplen']!;
    return cumplen / total * 100;
  }

  String determinarEstado() {
    if (criterios.isEmpty) {
      return estadoModeloEnRevision;
    }
    Map<String, int> conteo = verificarCriterios();

    if (conteo['noCumplen']! > 0) {
      return estadoRequiereAjustes;
    } else if (conteo['enRevision']! > 0) {
      return estadoModeloEnRevision;
    } else {
      return estadoAprobado;
    }
  }
}
