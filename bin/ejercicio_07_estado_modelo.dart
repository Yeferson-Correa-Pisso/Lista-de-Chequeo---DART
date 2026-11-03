import 'package:verificacion_dart/criterio.dart';
import 'package:verificacion_dart/modelo_analisis.dart';

ModeloAnalisis crearModeloDePrueba(String nombre, List<String> estados) {
  ModeloAnalisis modelo = ModeloAnalisis(1, nombre, 'Modelo de prueba');
  for (int i = 0; i < estados.length; i++) {
    modelo.agregarCriterio(Criterio(i + 1, 'Criterio ${i + 1}', estado: estados[i]));
  }
  return modelo;
}

void main() {
  print('=== EJERCICIO 7: Estado del modelo ===\n');

  ModeloAnalisis aprobado = crearModeloDePrueba(
    'Todos cumplen',
    [estadoCumple, estadoCumple, estadoCumple],
  );
  ModeloAnalisis ajustes = crearModeloDePrueba(
    'Hay un incumplimiento',
    [estadoCumple, estadoNoCumple, estadoEnRevision],
  );
  ModeloAnalisis revision = crearModeloDePrueba(
    'Sin incumplimientos, con revisión pendiente',
    [estadoCumple, estadoCumple, estadoEnRevision],
  );

  print('${aprobado.nombre} -> ${aprobado.determinarEstado()}');
  print('${ajustes.nombre} -> ${ajustes.determinarEstado()}');
  print('${revision.nombre} -> ${revision.determinarEstado()}');
}
