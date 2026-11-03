import 'package:verificacion_dart/criterio.dart';
import 'package:verificacion_dart/modelo_analisis.dart';
import 'package:verificacion_dart/verificacion.dart';

void main() {
  print('=== EJERCICIO 8: Clase Verificacion ===\n');

  ModeloAnalisis modelo = ModeloAnalisis(
    4,
    'Modelo de clases',
    'Define la estructura estática del sistema',
  );
  modelo.agregarCriterio(Criterio(1, 'Nombres en singular', estado: estadoCumple));
  modelo.agregarCriterio(Criterio(2, 'Atributos con tipo', estado: estadoCumple));
  modelo.agregarCriterio(Criterio(3, 'Multiplicidad definida', estado: estadoNoCumple));
  modelo.agregarCriterio(Criterio(4, 'Métodos definidos'));

  Verificacion verificacion = Verificacion(
    modelo,
    'Analista SENA',
    observaciones: 'Falta definir la multiplicidad de las relaciones',
  );

  print('Modelo evaluado: ${verificacion.modeloEvaluado.nombre}');
  print('Fecha: ${verificacion.fechaVerificacion}');
  print('Responsable: ${verificacion.responsable}');
  print('Porcentaje: ${formatearPorcentaje(verificacion.porcentaje)} %');
  print('Estado final: ${verificacion.estadoFinal}');
  print('Observaciones: ${verificacion.observaciones}');
}
