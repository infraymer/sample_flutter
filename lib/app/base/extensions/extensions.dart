import 'package:intl/intl.dart';

extension ObjectExt on Object {
  T cast<T>() => this is T ? this : null;
}

extension DoubleExt on double {
  String toAppNumber() =>
      NumberFormat(',###').format(this).replaceAll(',', ' ');
}
