import 'package:verificacion_dart/criterio.dart';

void main() {
  print('=== EJERCICIO 1: Clase Criterio ===\n');

  Criterio c1 = Criterio(1, 'Todos los actores están identificados');
  Criterio c2 = Criterio(
    2,
    'Cada caso de uso tiene nombre verbo + sustantivo',
    estado: 'Cumple',
  );
  Criterio c3 = Criterio(
    3,
    'Los casos de uso cubren los requisitos funcionales',
    estado: 'No cumple',
    observacion: 'Falta el caso de uso de reportes',
  );

  List<Criterio> criterios = [c1, c2, c3];

  for (Criterio c in criterios) {
    print('ID: ${c.id}');
    print('Descripción: ${c.descripcion}');
    print('Estado: ${c.estado}');
    print('Observación: ${c.observacion.isEmpty ? '-' : c.observacion}');
    print('');
  }
}
