import 'package:verificacion_dart/criterio.dart';
import 'package:verificacion_dart/modelo_analisis.dart';

void main() {
  print('=== EJERCICIO 3: Clase ModeloAnalisis ===\n');

  ModeloAnalisis casosUso = ModeloAnalisis(
    1,
    'Modelo de casos de uso',
    'Describe las funcionalidades del sistema desde la vista del usuario',
  );
  ModeloAnalisis actividades = ModeloAnalisis(
    2,
    'Modelo de actividades',
    'Representa el flujo de actividades de un proceso',
  );
  ModeloAnalisis secuencia = ModeloAnalisis(
    3,
    'Modelo de secuencia',
    'Muestra la interacción entre objetos a lo largo del tiempo',
  );
  ModeloAnalisis clases = ModeloAnalisis(
    4,
    'Modelo de clases',
    'Define la estructura estática del sistema',
  );

  casosUso.criterios.add(Criterio(1, 'Los actores están identificados'));
  actividades.criterios.add(Criterio(1, 'Existe nodo inicial y nodo final'));
  secuencia.criterios.add(Criterio(1, 'Los mensajes siguen orden cronológico'));
  clases.criterios.add(Criterio(1, 'Las clases tienen atributos con tipo'));

  List<ModeloAnalisis> modelos = [casosUso, actividades, secuencia, clases];

  for (ModeloAnalisis m in modelos) {
    print('ID: ${m.id}');
    print('Nombre: ${m.nombre}');
    print('Descripción: ${m.descripcion}');
    print('Criterios registrados: ${m.criterios.length}');
    print('');
  }
}
