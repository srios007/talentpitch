import 'package:intl/intl.dart';

class FormatMoney {
  static String formatMoney(double number) {
    final formatCurrency = NumberFormat.simpleCurrency(
      locale: 'es_CO',
      name: 'COP',
    );

    return '\$ ${formatCurrency.format(number).replaceAll(',00', '').replaceAll('\$', '')}';
  }
}