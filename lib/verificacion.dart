import 'modelo_analisis.dart';

class Verificacion {
  ModeloAnalisis modeloEvaluado;
  DateTime fechaVerificacion;
  String responsable;
  double porcentaje;
  String estadoFinal;
  String observaciones;

  Verificacion(
    ModeloAnalisis modelo,
    this.responsable, {
    this.observaciones = '',
  })  : modeloEvaluado = modelo,
        fechaVerificacion = DateTime.now(),
        porcentaje = modelo.calcularPorcentajeCumplimiento(),
        estadoFinal = modelo.determinarEstado();

  String _fechaTexto() {
    String dosDigitos(int n) => n.toString().padLeft(2, '0');
    return '${dosDigitos(fechaVerificacion.day)}/'
        '${dosDigitos(fechaVerificacion.month)}/'
        '${fechaVerificacion.year}';
  }

  String generarResumen() {
    Map<String, int> conteo = modeloEvaluado.verificarCriterios();

    StringBuffer resumen = StringBuffer();
    resumen.writeln('RESULTADO DE LA VERIFICACIÓN');
    resumen.writeln('');
    resumen.writeln('Modelo: ${modeloEvaluado.nombre}');
    resumen.writeln('Fecha: ${_fechaTexto()}');
    resumen.writeln('Responsable: $responsable');
    resumen.writeln('');
    resumen.writeln('Total de criterios: ${modeloEvaluado.contarCriterios()}');
    resumen.writeln('Cumplen: ${conteo['cumplen']}');
    resumen.writeln('No cumplen: ${conteo['noCumplen']}');
    resumen.writeln('En revisión: ${conteo['enRevision']}');
    resumen.writeln('');
    resumen.writeln('Cumplimiento: ${formatearPorcentaje(porcentaje)} %');
    resumen.writeln('');
    resumen.writeln('Estado: ${estadoFinal.toUpperCase()}');
    if (observaciones.isNotEmpty) {
      resumen.writeln('Observaciones: $observaciones');
    }
    return resumen.toString();
  }
}
