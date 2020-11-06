import 'package:intl/intl.dart';

const deliveryFormat = 'dd.MM, HH:mm';
const orderFormat = 'dd.MM, HH:mm';

String dateFormat(String format, DateTime date) =>
    DateFormat(format).format(date);