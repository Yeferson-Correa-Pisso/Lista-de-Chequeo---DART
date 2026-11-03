import 'package:verificacion_dart/criterio.dart';
import 'package:verificacion_dart/modelo_analisis.dart';
import 'package:verificacion_dart/verificacion.dart';

void main() {
  print('=== EJERCICIO 9: Resumen de la verificación ===\n');

  ModeloAnalisis modelo = ModeloAnalisis(
    1,
    'Modelo de casos de uso',
    'Describe las funcionalidades del sistema',
  );
  for (int i = 1; i <= 10; i++) {
    modelo.agregarCriterio(Criterio(i, 'Criterio de casos de uso $i'));
  }
  for (int i = 1; i <= 8; i++) {
    modelo.buscarCriterio(i)!.cambiarEstado(estadoCumple);
  }
  modelo.buscarCriterio(9)!.cambiarEstado(estadoNoCumple);

  Verificacion verificacion = Verificacion(modelo, 'Analista SENA');
  print(verificacion.generarResumen());
}
