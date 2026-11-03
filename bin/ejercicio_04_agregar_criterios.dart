import 'package:verificacion_dart/criterio.dart';
import 'package:verificacion_dart/modelo_analisis.dart';

void main() {
  print('=== EJERCICIO 4: Agregar criterios a un modelo ===\n');

  ModeloAnalisis modelo = ModeloAnalisis(
    1,
    'Modelo de casos de uso',
    'Describe las funcionalidades del sistema',
  );

  print('Criterios al inicio: ${modelo.contarCriterios()}\n');

  print('--- Agregar ---');
  modelo.agregarCriterio(Criterio(1, 'Los actores están identificados'));
  modelo.agregarCriterio(Criterio(2, 'Cada caso de uso tiene un nombre claro'));
  modelo.agregarCriterio(Criterio(3, 'Se definen precondiciones'));
  modelo.agregarCriterio(Criterio(3, 'Criterio con id repetido'));
  print('Criterios después de agregar: ${modelo.contarCriterios()}\n');

  print('--- Consultar ---');
  for (Criterio c in modelo.consultarCriterios()) {
    print('Consultado -> ${c.id}: ${c.descripcion}');
  }
  print('');

  print('--- Mostrar ---');
  modelo.mostrarCriterios();
  print('');

  print('--- Buscar ---');
  Criterio? encontrado = modelo.buscarCriterio(2);
  if (encontrado != null) {
    print('Encontrado: ${encontrado.descripcion}');
  }
  Criterio? noExiste = modelo.buscarCriterio(99);
  print(noExiste == null ? 'El criterio 99 no existe' : 'Encontrado');
}
