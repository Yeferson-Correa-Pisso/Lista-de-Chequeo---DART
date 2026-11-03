import 'package:verificacion_dart/criterio.dart';
import 'package:verificacion_dart/modelo_analisis.dart';

void main() {
  print('=== EJERCICIO 6: Porcentaje de cumplimiento ===\n');

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
  double porcentaje = modelo.calcularPorcentajeCumplimiento();
  print('Total: ${modelo.contarCriterios()} criterios');
  print('Cumplen: ${modelo.verificarCriterios()['cumplen']}');
  print('Porcentaje de cumplimiento: ${formatearPorcentaje(porcentaje)} %\n');

  ModeloAnalisis vacio = ModeloAnalisis(2, 'Modelo vacío', 'Sin criterios');
  print('Modelo vacío -> ${formatearPorcentaje(vacio.calcularPorcentajeCumplimiento())} %');

  ModeloAnalisis tres = ModeloAnalisis(3, 'Modelo de tres', 'Tres criterios');
  tres.agregarCriterio(Criterio(1, 'A', estado: estadoCumple));
  tres.agregarCriterio(Criterio(2, 'B', estado: estadoCumple));
  tres.agregarCriterio(Criterio(3, 'C', estado: estadoNoCumple));
  print('2 de 3 cumplen -> ${formatearPorcentaje(tres.calcularPorcentajeCumplimiento())} %');
}
