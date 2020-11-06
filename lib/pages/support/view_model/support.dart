class Support {
  final String whatsapp;
  final String telegram;
  final String phone;

  Support({this.whatsapp, this.telegram, this.phone});

  Map<String, dynamic> toMap() {
    return {
      'whatsapp': this.whatsapp,
      'telegram': this.telegram,
      'phone': this.phone,
    };
  }

  factory Support.fromMap(Map<String, dynamic> map) {
    return new Support(
      whatsapp: map['whatsapp'] as String,
      telegram: map['telegram'] as String,
      phone: map['phone'] as String,
    );
  }
}