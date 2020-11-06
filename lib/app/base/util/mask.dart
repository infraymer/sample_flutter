import 'package:string_mask/string_mask.dart';

String formatToPhoneMask(String phone) {
  if (phone.isEmpty) return phone;
  final value = phone.substring(1, phone.length);
  return StringMask('+# (###) ### ## ##').apply(value);
}
