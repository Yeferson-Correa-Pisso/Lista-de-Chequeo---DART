import 'package:verificacion_dart/criterio.dart';
import 'package:verificacion_dart/modelo_analisis.dart';

void main() {
  print('=== EJERCICIO 5: Verificar los criterios ===\n');

  ModeloAnalisis modelo = ModeloAnalisis(
    2,
    'Modelo de actividades',
    'Representa el flujo de actividades de un proceso',
  );

  modelo.agregarCriterio(Criterio(1, 'Existe nodo inicial', estado: estadoCumple));
  modelo.agregarCriterio(Criterio(2, 'Existe nodo final', estado: estadoCumple));
  modelo.agregarCriterio(Criterio(3, 'Las decisiones tienen guardas', estado: estadoNoCumple));
  modelo.agregarCriterio(Criterio(4, 'Hay responsables por actividad'));
  modelo.agregarCriterio(Criterio(5, 'Los flujos paralelos usan fork/join', estado: estadoCumple));
  modelo.agregarCriterio(Criterio(6, 'No hay actividades aisladas', estado: estadoNoCumple));

  Map<String, int> resultado = modelo.verificarCriterios();

  print('Modelo: ${modelo.nombre}');
  print('Total de criterios: ${modelo.contarCriterios()}');
  print('Cumplen: ${resultado['cumplen']}');
  print('No cumplen: ${resultado['noCumplen']}');
  print('Requieren revisión: ${resultado['enRevision']}');
}
