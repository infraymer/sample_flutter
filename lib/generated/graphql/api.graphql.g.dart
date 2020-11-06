// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUser$MutationRoot$User _$UpdateUser$MutationRoot$UserFromJson(
    Map<String, dynamic> json) {
  return UpdateUser$MutationRoot$User()
    ..$$typename = json['__typename'] as String
    ..id = json['id'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..displayName = json['display_name'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..phoneNumber = json['phone_number'] as String
    ..fullName = json['full_name'] as String
    ..city = json['city'] as String
    ..address = json['address'] as String;
}

Map<String, dynamic> _$UpdateUser$MutationRoot$UserToJson(
    UpdateUser$MutationRoot$User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  writeNotNull('id', instance.id);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  writeNotNull('display_name', instance.displayName);
  writeNotNull('avatar_url', instance.avatarUrl);
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('full_name', instance.fullName);
  writeNotNull('city', instance.city);
  writeNotNull('address', instance.address);
  return val;
}

UpdateUser$MutationRoot _$UpdateUser$MutationRootFromJson(
    Map<String, dynamic> json) {
  return UpdateUser$MutationRoot()
    ..user = json['user'] == null
        ? null
        : UpdateUser$MutationRoot$User.fromJson(
            json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateUser$MutationRootToJson(
    UpdateUser$MutationRoot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  return val;
}

UsersSetInput _$UsersSetInputFromJson(Map<String, dynamic> json) {
  return UsersSetInput(
    address: json['address'] as String,
    avatarUrl: json['avatar_url'] as String,
    city: json['city'] as String,
    displayName: json['display_name'] as String,
    fullName: json['full_name'] as String,
    phoneNumber: json['phone_number'] as String,
  );
}

Map<String, dynamic> _$UsersSetInputToJson(UsersSetInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('address', instance.address);
  writeNotNull('avatar_url', instance.avatarUrl);
  writeNotNull('city', instance.city);
  writeNotNull('display_name', instance.displayName);
  writeNotNull('full_name', instance.fullName);
  writeNotNull('phone_number', instance.phoneNumber);
  return val;
}

AddApplication$MutationRoot$Credit _$AddApplication$MutationRoot$CreditFromJson(
    Map<String, dynamic> json) {
  return AddApplication$MutationRoot$Credit()
    ..$$typename = json['__typename'] as String
    ..id = json['id'] as String
    ..status = _$enumDecodeNullable(_$CreditStatusEnumEnumMap, json['status'],
        unknownValue: CreditStatusEnum.artemisUnknown)
    ..sum = (json['sum'] as num)?.toDouble()
    ..term = json['term'] as int
    ..nextPaymentSum = (json['next_payment_sum'] as num)?.toDouble()
    ..nextPaymentDate = json['next_payment_date'] == null
        ? null
        : DateTime.parse(json['next_payment_date'] as String)
    ..otherPayments = (json['other_payments'] as num)?.toDouble()
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..creditStatus = json['credit_status'] == null
        ? null
        : CreditMixin$CreditStatus.fromJson(
            json['credit_status'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AddApplication$MutationRoot$CreditToJson(
    AddApplication$MutationRoot$Credit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  writeNotNull('id', instance.id);
  writeNotNull('status', _$CreditStatusEnumEnumMap[instance.status]);
  writeNotNull('sum', instance.sum);
  writeNotNull('term', instance.term);
  writeNotNull('next_payment_sum', instance.nextPaymentSum);
  writeNotNull(
      'next_payment_date', instance.nextPaymentDate?.toIso8601String());
  writeNotNull('other_payments', instance.otherPayments);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('credit_status', instance.creditStatus?.toJson());
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$CreditStatusEnumEnumMap = {
  CreditStatusEnum.approved: 'approved',
  CreditStatusEnum.denied: 'denied',
  CreditStatusEnum.issued: 'issued',
  CreditStatusEnum.paid: 'paid',
  CreditStatusEnum.request: 'request',
  CreditStatusEnum.waitUserConfirm: 'wait_user_confirm',
  CreditStatusEnum.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

AddApplication$MutationRoot$User _$AddApplication$MutationRoot$UserFromJson(
    Map<String, dynamic> json) {
  return AddApplication$MutationRoot$User()
    ..$$typename = json['__typename'] as String
    ..id = json['id'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..displayName = json['display_name'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..phoneNumber = json['phone_number'] as String
    ..fullName = json['full_name'] as String
    ..city = json['city'] as String
    ..address = json['address'] as String;
}

Map<String, dynamic> _$AddApplication$MutationRoot$UserToJson(
    AddApplication$MutationRoot$User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  writeNotNull('id', instance.id);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  writeNotNull('display_name', instance.displayName);
  writeNotNull('avatar_url', instance.avatarUrl);
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('full_name', instance.fullName);
  writeNotNull('city', instance.city);
  writeNotNull('address', instance.address);
  return val;
}

AddApplication$MutationRoot _$AddApplication$MutationRootFromJson(
    Map<String, dynamic> json) {
  return AddApplication$MutationRoot()
    ..credit = json['credit'] == null
        ? null
        : AddApplication$MutationRoot$Credit.fromJson(
            json['credit'] as Map<String, dynamic>)
    ..user = json['user'] == null
        ? null
        : AddApplication$MutationRoot$User.fromJson(
            json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AddApplication$MutationRootToJson(
    AddApplication$MutationRoot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('credit', instance.credit?.toJson());
  writeNotNull('user', instance.user?.toJson());
  return val;
}

CreditMixin$CreditStatus _$CreditMixin$CreditStatusFromJson(
    Map<String, dynamic> json) {
  return CreditMixin$CreditStatus()
    ..status = json['status'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$CreditMixin$CreditStatusToJson(
    CreditMixin$CreditStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('name', instance.name);
  return val;
}

ContactsInsertInput _$ContactsInsertInputFromJson(Map<String, dynamic> json) {
  return ContactsInsertInput(
    credits: json['credits'] == null
        ? null
        : CreditsArrRelInsertInput.fromJson(
            json['credits'] as Map<String, dynamic>),
    name: json['name'] as String,
    phoneNumber: json['phone_number'] as String,
    whoIs: json['who_is'] as String,
  );
}

Map<String, dynamic> _$ContactsInsertInputToJson(ContactsInsertInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('credits', instance.credits?.toJson());
  writeNotNull('name', instance.name);
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('who_is', instance.whoIs);
  return val;
}

ContactsObjRelInsertInput _$ContactsObjRelInsertInputFromJson(
    Map<String, dynamic> json) {
  return ContactsObjRelInsertInput(
    data: json['data'] == null
        ? null
        : ContactsInsertInput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ContactsObjRelInsertInputToJson(
    ContactsObjRelInsertInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.toJson());
  return val;
}

CreditsArrRelInsertInput _$CreditsArrRelInsertInputFromJson(
    Map<String, dynamic> json) {
  return CreditsArrRelInsertInput(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : CreditsInsertInput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CreditsArrRelInsertInputToJson(
    CreditsArrRelInsertInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.map((e) => e?.toJson())?.toList());
  return val;
}

CreditsInsertInput _$CreditsInsertInputFromJson(Map<String, dynamic> json) {
  return CreditsInsertInput(
    autoInfo: json['auto_info'] as String,
    cardNumber: json['card_number'] as String,
    contact: json['contact'] == null
        ? null
        : ContactsObjRelInsertInput.fromJson(
            json['contact'] as Map<String, dynamic>),
    documents: json['documents'] == null
        ? null
        : DocumentsArrRelInsertInput.fromJson(
            json['documents'] as Map<String, dynamic>),
    monthlyProfit: (json['monthly_profit'] as num)?.toDouble(),
    otherPayments: (json['other_payments'] as num)?.toDouble(),
    requestSum: (json['request_sum'] as num)?.toDouble(),
    requestTerm: json['request_term'] as int,
    work: json['work'] == null
        ? null
        : WorksObjRelInsertInput.fromJson(json['work'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreditsInsertInputToJson(CreditsInsertInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('auto_info', instance.autoInfo);
  writeNotNull('card_number', instance.cardNumber);
  writeNotNull('contact', instance.contact?.toJson());
  writeNotNull('documents', instance.documents?.toJson());
  writeNotNull('monthly_profit', instance.monthlyProfit);
  writeNotNull('other_payments', instance.otherPayments);
  writeNotNull('request_sum', instance.requestSum);
  writeNotNull('request_term', instance.requestTerm);
  writeNotNull('work', instance.work?.toJson());
  return val;
}

CreditsObjRelInsertInput _$CreditsObjRelInsertInputFromJson(
    Map<String, dynamic> json) {
  return CreditsObjRelInsertInput(
    data: json['data'] == null
        ? null
        : CreditsInsertInput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreditsObjRelInsertInputToJson(
    CreditsObjRelInsertInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.toJson());
  return val;
}

DocumentsArrRelInsertInput _$DocumentsArrRelInsertInputFromJson(
    Map<String, dynamic> json) {
  return DocumentsArrRelInsertInput(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentsInsertInput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DocumentsArrRelInsertInputToJson(
    DocumentsArrRelInsertInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.map((e) => e?.toJson())?.toList());
  return val;
}

DocumentsInsertInput _$DocumentsInsertInputFromJson(Map<String, dynamic> json) {
  return DocumentsInsertInput(
    credit: json['credit'] == null
        ? null
        : CreditsObjRelInsertInput.fromJson(
            json['credit'] as Map<String, dynamic>),
    creditId: json['credit_id'] as String,
    file: json['file'] as String,
    type: _$enumDecodeNullable(_$DocumentTypeEnumEnumMap, json['type'],
        unknownValue: DocumentTypeEnum.artemisUnknown),
  );
}

Map<String, dynamic> _$DocumentsInsertInputToJson(
    DocumentsInsertInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('credit', instance.credit?.toJson());
  writeNotNull('credit_id', instance.creditId);
  writeNotNull('file', instance.file);
  writeNotNull('type', _$DocumentTypeEnumEnumMap[instance.type]);
  return val;
}

const _$DocumentTypeEnumEnumMap = {
  DocumentTypeEnum.autoPhotoPts: 'auto_photo_pts',
  DocumentTypeEnum.autoPhotoPtsBack: 'auto_photo_pts_back',
  DocumentTypeEnum.autoPhotoSts: 'auto_photo_sts',
  DocumentTypeEnum.autoPhotoStsBack: 'auto_photo_sts_back',
  DocumentTypeEnum.autoPhotoVin: 'auto_photo_vin',
  DocumentTypeEnum.autoVideo360: 'auto_video_360',
  DocumentTypeEnum.investorDogovor: 'investor_dogovor',
  DocumentTypeEnum.passportPhotoFamily: 'passport_photo_family',
  DocumentTypeEnum.passportPhotoFirstPage: 'passport_photo_first_page',
  DocumentTypeEnum.passportPhotoRegistration: 'passport_photo_registration',
  DocumentTypeEnum.passportPhotoRegistrationNextPage:
      'passport_photo_registration_next_page',
  DocumentTypeEnum.passportSelfie: 'passport_selfie',
  DocumentTypeEnum.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

WorksInsertInput _$WorksInsertInputFromJson(Map<String, dynamic> json) {
  return WorksInsertInput(
    address: json['address'] as String,
    credits: json['credits'] == null
        ? null
        : CreditsArrRelInsertInput.fromJson(
            json['credits'] as Map<String, dynamic>),
    inn: json['inn'] as String,
    name: json['name'] as String,
    phoneNumber: json['phone_number'] as String,
  );
}

Map<String, dynamic> _$WorksInsertInputToJson(WorksInsertInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('address', instance.address);
  writeNotNull('credits', instance.credits?.toJson());
  writeNotNull('inn', instance.inn);
  writeNotNull('name', instance.name);
  writeNotNull('phone_number', instance.phoneNumber);
  return val;
}

WorksObjRelInsertInput _$WorksObjRelInsertInputFromJson(
    Map<String, dynamic> json) {
  return WorksObjRelInsertInput(
    data: json['data'] == null
        ? null
        : WorksInsertInput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WorksObjRelInsertInputToJson(
    WorksObjRelInsertInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.toJson());
  return val;
}

GetOffices$QueryRoot$Offices _$GetOffices$QueryRoot$OfficesFromJson(
    Map<String, dynamic> json) {
  return GetOffices$QueryRoot$Offices()
    ..$$typename = json['__typename'] as String
    ..id = json['id'] as String
    ..workTime = json['work_time'] as String
    ..workDays = json['work_days'] as String
    ..address = json['address'] as String
    ..phoneNumber = json['phone_number'] as String
    ..coordinates = json['coordinates'] as Map<String, dynamic>;
}

Map<String, dynamic> _$GetOffices$QueryRoot$OfficesToJson(
    GetOffices$QueryRoot$Offices instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  writeNotNull('id', instance.id);
  writeNotNull('work_time', instance.workTime);
  writeNotNull('work_days', instance.workDays);
  writeNotNull('address', instance.address);
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('coordinates', instance.coordinates);
  return val;
}

GetOffices$QueryRoot _$GetOffices$QueryRootFromJson(Map<String, dynamic> json) {
  return GetOffices$QueryRoot()
    ..offices = (json['offices'] as List)
        ?.map((e) => e == null
            ? null
            : GetOffices$QueryRoot$Offices.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetOffices$QueryRootToJson(
    GetOffices$QueryRoot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('offices', instance.offices?.map((e) => e?.toJson())?.toList());
  return val;
}

GetCurrentUser$QueryRoot$User _$GetCurrentUser$QueryRoot$UserFromJson(
    Map<String, dynamic> json) {
  return GetCurrentUser$QueryRoot$User()
    ..$$typename = json['__typename'] as String
    ..id = json['id'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..displayName = json['display_name'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..phoneNumber = json['phone_number'] as String
    ..fullName = json['full_name'] as String
    ..city = json['city'] as String
    ..address = json['address'] as String;
}

Map<String, dynamic> _$GetCurrentUser$QueryRoot$UserToJson(
    GetCurrentUser$QueryRoot$User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  writeNotNull('id', instance.id);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  writeNotNull('display_name', instance.displayName);
  writeNotNull('avatar_url', instance.avatarUrl);
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('full_name', instance.fullName);
  writeNotNull('city', instance.city);
  writeNotNull('address', instance.address);
  return val;
}

GetCurrentUser$QueryRoot _$GetCurrentUser$QueryRootFromJson(
    Map<String, dynamic> json) {
  return GetCurrentUser$QueryRoot()
    ..user = json['user'] == null
        ? null
        : GetCurrentUser$QueryRoot$User.fromJson(
            json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetCurrentUser$QueryRootToJson(
    GetCurrentUser$QueryRoot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  return val;
}

CurrentUser$SubscriptionRoot$User _$CurrentUser$SubscriptionRoot$UserFromJson(
    Map<String, dynamic> json) {
  return CurrentUser$SubscriptionRoot$User()
    ..$$typename = json['__typename'] as String
    ..id = json['id'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..displayName = json['display_name'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..phoneNumber = json['phone_number'] as String
    ..fullName = json['full_name'] as String
    ..city = json['city'] as String
    ..address = json['address'] as String;
}

Map<String, dynamic> _$CurrentUser$SubscriptionRoot$UserToJson(
    CurrentUser$SubscriptionRoot$User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  writeNotNull('id', instance.id);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  writeNotNull('display_name', instance.displayName);
  writeNotNull('avatar_url', instance.avatarUrl);
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('full_name', instance.fullName);
  writeNotNull('city', instance.city);
  writeNotNull('address', instance.address);
  return val;
}

CurrentUser$SubscriptionRoot _$CurrentUser$SubscriptionRootFromJson(
    Map<String, dynamic> json) {
  return CurrentUser$SubscriptionRoot()
    ..user = json['user'] == null
        ? null
        : CurrentUser$SubscriptionRoot$User.fromJson(
            json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CurrentUser$SubscriptionRootToJson(
    CurrentUser$SubscriptionRoot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  return val;
}

Credits$SubscriptionRoot$Credits$Payments
    _$Credits$SubscriptionRoot$Credits$PaymentsFromJson(
        Map<String, dynamic> json) {
  return Credits$SubscriptionRoot$Credits$Payments()
    ..$$typename = json['__typename'] as String
    ..id = json['id'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..sum = (json['sum'] as num)?.toDouble()
    ..creditId = json['credit_id'] as String
    ..credit = json['credit'] == null
        ? null
        : PaymentMixin$Credit.fromJson(json['credit'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Credits$SubscriptionRoot$Credits$PaymentsToJson(
    Credits$SubscriptionRoot$Credits$Payments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  writeNotNull('id', instance.id);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('sum', instance.sum);
  writeNotNull('credit_id', instance.creditId);
  writeNotNull('credit', instance.credit?.toJson());
  return val;
}

Credits$SubscriptionRoot$Credits _$Credits$SubscriptionRoot$CreditsFromJson(
    Map<String, dynamic> json) {
  return Credits$SubscriptionRoot$Credits()
    ..$$typename = json['__typename'] as String
    ..id = json['id'] as String
    ..status = _$enumDecodeNullable(_$CreditStatusEnumEnumMap, json['status'],
        unknownValue: CreditStatusEnum.artemisUnknown)
    ..sum = (json['sum'] as num)?.toDouble()
    ..term = json['term'] as int
    ..nextPaymentSum = (json['next_payment_sum'] as num)?.toDouble()
    ..nextPaymentDate = json['next_payment_date'] == null
        ? null
        : DateTime.parse(json['next_payment_date'] as String)
    ..otherPayments = (json['other_payments'] as num)?.toDouble()
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..creditStatus = json['credit_status'] == null
        ? null
        : CreditMixin$CreditStatus.fromJson(
            json['credit_status'] as Map<String, dynamic>)
    ..payments = (json['payments'] as List)
        ?.map((e) => e == null
            ? null
            : Credits$SubscriptionRoot$Credits$Payments.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Credits$SubscriptionRoot$CreditsToJson(
    Credits$SubscriptionRoot$Credits instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  writeNotNull('id', instance.id);
  writeNotNull('status', _$CreditStatusEnumEnumMap[instance.status]);
  writeNotNull('sum', instance.sum);
  writeNotNull('term', instance.term);
  writeNotNull('next_payment_sum', instance.nextPaymentSum);
  writeNotNull(
      'next_payment_date', instance.nextPaymentDate?.toIso8601String());
  writeNotNull('other_payments', instance.otherPayments);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('credit_status', instance.creditStatus?.toJson());
  writeNotNull(
      'payments', instance.payments?.map((e) => e?.toJson())?.toList());
  return val;
}

Credits$SubscriptionRoot _$Credits$SubscriptionRootFromJson(
    Map<String, dynamic> json) {
  return Credits$SubscriptionRoot()
    ..credits = (json['credits'] as List)
        ?.map((e) => e == null
            ? null
            : Credits$SubscriptionRoot$Credits.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Credits$SubscriptionRootToJson(
    Credits$SubscriptionRoot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('credits', instance.credits?.map((e) => e?.toJson())?.toList());
  return val;
}

PaymentMixin$Credit _$PaymentMixin$CreditFromJson(Map<String, dynamic> json) {
  return PaymentMixin$Credit()
    ..$$typename = json['__typename'] as String
    ..id = json['id'] as String;
}

Map<String, dynamic> _$PaymentMixin$CreditToJson(PaymentMixin$Credit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  writeNotNull('id', instance.id);
  return val;
}

Notifications$SubscriptionRoot$Notifications
    _$Notifications$SubscriptionRoot$NotificationsFromJson(
        Map<String, dynamic> json) {
  return Notifications$SubscriptionRoot$Notifications()
    ..$$typename = json['__typename'] as String
    ..id = json['id'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..message = json['message'] as String
    ..delivered = json['delivered'] as bool
    ..credit = json['credit'] == null
        ? null
        : NotificationMixin$Credit.fromJson(
            json['credit'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Notifications$SubscriptionRoot$NotificationsToJson(
    Notifications$SubscriptionRoot$Notifications instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  writeNotNull('id', instance.id);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('message', instance.message);
  writeNotNull('delivered', instance.delivered);
  writeNotNull('credit', instance.credit?.toJson());
  return val;
}

Notifications$SubscriptionRoot _$Notifications$SubscriptionRootFromJson(
    Map<String, dynamic> json) {
  return Notifications$SubscriptionRoot()
    ..notifications = (json['notifications'] as List)
        ?.map((e) => e == null
            ? null
            : Notifications$SubscriptionRoot$Notifications.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Notifications$SubscriptionRootToJson(
    Notifications$SubscriptionRoot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('notifications',
      instance.notifications?.map((e) => e?.toJson())?.toList());
  return val;
}

NotificationMixin$Credit _$NotificationMixin$CreditFromJson(
    Map<String, dynamic> json) {
  return NotificationMixin$Credit()
    ..$$typename = json['__typename'] as String
    ..id = json['id'] as String
    ..status = _$enumDecodeNullable(_$CreditStatusEnumEnumMap, json['status'],
        unknownValue: CreditStatusEnum.artemisUnknown)
    ..sum = (json['sum'] as num)?.toDouble()
    ..term = json['term'] as int
    ..nextPaymentSum = (json['next_payment_sum'] as num)?.toDouble()
    ..nextPaymentDate = json['next_payment_date'] == null
        ? null
        : DateTime.parse(json['next_payment_date'] as String)
    ..otherPayments = (json['other_payments'] as num)?.toDouble()
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..creditStatus = json['credit_status'] == null
        ? null
        : CreditMixin$CreditStatus.fromJson(
            json['credit_status'] as Map<String, dynamic>);
}

Map<String, dynamic> _$NotificationMixin$CreditToJson(
    NotificationMixin$Credit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  writeNotNull('id', instance.id);
  writeNotNull('status', _$CreditStatusEnumEnumMap[instance.status]);
  writeNotNull('sum', instance.sum);
  writeNotNull('term', instance.term);
  writeNotNull('next_payment_sum', instance.nextPaymentSum);
  writeNotNull(
      'next_payment_date', instance.nextPaymentDate?.toIso8601String());
  writeNotNull('other_payments', instance.otherPayments);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('credit_status', instance.creditStatus?.toJson());
  return val;
}

UpdateUserArguments _$UpdateUserArgumentsFromJson(Map<String, dynamic> json) {
  return UpdateUserArguments(
    user: json['user'] == null
        ? null
        : UsersSetInput.fromJson(json['user'] as Map<String, dynamic>),
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$UpdateUserArgumentsToJson(UpdateUserArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user?.toJson());
  writeNotNull('userId', instance.userId);
  return val;
}

AddApplicationArguments _$AddApplicationArgumentsFromJson(
    Map<String, dynamic> json) {
  return AddApplicationArguments(
    credit: json['credit'] == null
        ? null
        : CreditsInsertInput.fromJson(json['credit'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : UsersSetInput.fromJson(json['user'] as Map<String, dynamic>),
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$AddApplicationArgumentsToJson(
    AddApplicationArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('credit', instance.credit?.toJson());
  writeNotNull('user', instance.user?.toJson());
  writeNotNull('userId', instance.userId);
  return val;
}

GetCurrentUserArguments _$GetCurrentUserArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetCurrentUserArguments(
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$GetCurrentUserArgumentsToJson(
    GetCurrentUserArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userId', instance.userId);
  return val;
}

CurrentUserArguments _$CurrentUserArgumentsFromJson(Map<String, dynamic> json) {
  return CurrentUserArguments(
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$CurrentUserArgumentsToJson(
    CurrentUserArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userId', instance.userId);
  return val;
}
