import 'package:intl/intl.dart';

///
/// Esta clase contiene todos los valores constantes en la aplicación
///

class AppConstants {
  final numberFormat = NumberFormat.currency(symbol: '\$', decimalDigits: 0);
}

AppConstants constants = AppConstants();
