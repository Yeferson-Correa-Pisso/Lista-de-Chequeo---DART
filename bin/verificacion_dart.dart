import 'package:verificacion_dart/criterio.dart';
import 'package:verificacion_dart/modelo_analisis.dart';
import 'package:verificacion_dart/verificacion.dart';

const String responsable = 'Analista SENA';

ModeloAnalisis crearModelo(
  int id,
  String nombre,
  String descripcion,
  List<String> descripcionesCriterios,
) {
  ModeloAnalisis modelo = ModeloAnalisis(id, nombre, descripcion);
  for (int i = 0; i < descripcionesCriterios.length; i++) {
    modelo.agregarCriterio(Criterio(i + 1, descripcionesCriterios[i]));
  }
  return modelo;
}

void evaluar(
  ModeloAnalisis modelo,
  int idCriterio,
  String estado, [
  String observacion = '',
]) {
  Criterio? criterio = modelo.buscarCriterio(idCriterio);
  if (criterio == null) {
    print('No existe el criterio $idCriterio en "${modelo.nombre}"');
    return;
  }
  criterio.cambiarEstado(estado);
  if (observacion.isNotEmpty) {
    criterio.registrarObservacion(observacion);
  }
}

void procesarResultados(ModeloAnalisis modelo, String observaciones) {
  print('=' * 55);
  print('MODELO: ${modelo.nombre}');
  print('=' * 55);
  modelo.mostrarCriterios();
  print('');

  Map<String, int> conteo = modelo.verificarCriterios();
  print('Procesado -> cumplen: ${conteo['cumplen']}, '
      'no cumplen: ${conteo['noCumplen']}, '
      'en revisión: ${conteo['enRevision']}');
  print('Porcentaje: ${formatearPorcentaje(modelo.calcularPorcentajeCumplimiento())} %');
  print('Estado: ${modelo.determinarEstado()}\n');

  Verificacion verificacion = Verificacion(
    modelo,
    responsable,
    observaciones: observaciones,
  );
  print(verificacion.generarResumen());
}

void main() {
  ModeloAnalisis casosUso = crearModelo(
    1,
    'Modelo de casos de uso',
    'Describe las funcionalidades del sistema desde la vista del usuario',
    [
      'Todos los actores están identificados y nombrados',
      'Cada caso de uso tiene nombre en formato verbo + sustantivo',
      'Cada caso de uso está asociado al menos a un actor',
      'Las relaciones include y extend están bien utilizadas',
      'Los casos de uso cubren todos los requisitos funcionales',
      'Existe una descripción textual de cada caso de uso',
      'Se definen precondiciones y postcondiciones',
      'Los límites del sistema están claramente delimitados',
      'No existen casos de uso duplicados',
      'La notación UML es correcta',
    ],
  );
  for (int id in [1, 2, 3, 4, 6, 7, 8, 10]) {
    evaluar(casosUso, id, estadoCumple);
  }
  evaluar(casosUso, 5, estadoNoCumple, 'Faltan casos de uso del módulo de reportes');
  procesarResultados(casosUso, 'Completar los casos de uso de reportes');

  ModeloAnalisis actividades = crearModelo(
    2,
    'Modelo de actividades',
    'Representa el flujo de actividades de un proceso',
    [
      'Existe un nodo inicial y al menos un nodo final',
      'Las decisiones tienen condiciones de guarda',
      'No hay actividades aisladas, todas tienen entrada y salida',
      'Se identifican los responsables (calles) de cada actividad',
      'Los flujos paralelos usan fork y join',
    ],
  );
  for (int id in [1, 2, 3, 4, 5]) {
    evaluar(actividades, id, estadoCumple);
  }
  procesarResultados(actividades, 'Modelo listo para desarrollo');

  ModeloAnalisis secuencia = crearModelo(
    3,
    'Modelo de secuencia',
    'Muestra la interacción entre objetos a lo largo del tiempo',
    [
      'Los participantes corresponden a actores o clases del modelo',
      'Los mensajes siguen un orden cronológico',
      'Los mensajes tienen nombres de operaciones claros',
      'Se muestran los mensajes de retorno',
      'Cubre el escenario principal del caso de uso',
    ],
  );
  for (int id in [1, 2, 3, 4]) {
    evaluar(secuencia, id, estadoCumple);
  }
  evaluar(secuencia, 5, estadoEnRevision, 'Pendiente validar con el cliente');
  procesarResultados(secuencia, 'Esperando validación del escenario');

  ModeloAnalisis clases = crearModelo(
    4,
    'Modelo de clases',
    'Define la estructura estática del sistema',
    [
      'Los nombres de las clases son sustantivos en singular',
      'Los atributos tienen tipo de dato',
      'Los métodos están definidos con sus parámetros',
      'Las relaciones tienen multiplicidad',
      'La herencia y las asociaciones no generan ciclos',
    ],
  );
  for (int id in [1, 2, 3]) {
    evaluar(clases, id, estadoCumple);
  }
  evaluar(clases, 4, estadoNoCumple, 'Falta la multiplicidad en 3 relaciones');
  procesarResultados(clases, 'Corregir multiplicidades y revisar ciclos');

  print('=' * 55);
  print('RESUMEN GENERAL');
  print('=' * 55);
  List<ModeloAnalisis> modelos = [casosUso, actividades, secuencia, clases];
  for (ModeloAnalisis m in modelos) {
    print('${m.nombre}: '
        '${formatearPorcentaje(m.calcularPorcentajeCumplimiento())} % '
        '-> ${m.determinarEstado()}');
  }
}
