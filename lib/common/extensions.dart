import 'package:intl/intl.dart';

extension IntExtension on int {
  String toLocalCurrency() {
    return NumberFormat.currency(
      locale: 'id_ID',
      decimalDigits: 0,
      symbol: 'Rp',
    ).format(this);
  }
}
