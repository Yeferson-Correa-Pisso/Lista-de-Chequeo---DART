import 'package:verificacion_dart/criterio.dart';

void main() {
  print('=== EJERCICIO 2: Comportamientos de Criterio ===\n');

  Criterio criterio = Criterio(1, 'Las relaciones include/extend son correctas');

  print('--- Estado inicial ---');
  criterio.mostrarInformacion();
  print('¿Cumple? ${criterio.cumple()}\n'); 

  print('--- Cambiar estado a "No cumple" y registrar observación ---');
  criterio.cambiarEstado(estadoNoCumple);
  criterio.registrarObservacion('El extend apunta en sentido contrario');
  criterio.mostrarInformacion();
  print('¿Cumple? ${criterio.cumple()}\n');

  print('--- Corregido: cambiar estado a "Cumple" ---');
  criterio.cambiarEstado(estadoCumple);
  criterio.registrarObservacion('Corregido por el analista');
  criterio.mostrarInformacion();
  print('¿Cumple? ${criterio.cumple()}\n');

  print('--- Estado inválido ---');
  try {
    criterio.cambiarEstado('Quizás');
  } on ArgumentError catch (e) {
    print('Error controlado: ${e.message}');
  }
}
