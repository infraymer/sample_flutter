// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'api.graphql.g.dart';

mixin UserMixin {
  @JsonKey(name: '__typename')
  String $$typename;
  String id;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'updated_at')
  DateTime updatedAt;
  @JsonKey(name: 'display_name')
  String displayName;
  @JsonKey(name: 'avatar_url')
  String avatarUrl;
  @JsonKey(name: 'phone_number')
  String phoneNumber;
  @JsonKey(name: 'full_name')
  String fullName;
  String city;
  String address;
}
mixin CreditMixin {
  @JsonKey(name: '__typename')
  String $$typename;
  String id;
  @JsonKey(unknownEnumValue: CreditStatusEnum.artemisUnknown)
  CreditStatusEnum status;
  double sum;
  int term;
  @JsonKey(name: 'next_payment_sum')
  double nextPaymentSum;
  @JsonKey(name: 'next_payment_date')
  DateTime nextPaymentDate;
  @JsonKey(name: 'other_payments')
  double otherPayments;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'credit_status')
  CreditMixin$CreditStatus creditStatus;
}
mixin OfficeMixin {
  @JsonKey(name: '__typename')
  String $$typename;
  String id;
  @JsonKey(name: 'work_time')
  String workTime;
  @JsonKey(name: 'work_days')
  String workDays;
  String address;
  @JsonKey(name: 'phone_number')
  String phoneNumber;
  Map coordinates;
}
mixin PaymentMixin {
  @JsonKey(name: '__typename')
  String $$typename;
  String id;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  double sum;
  @JsonKey(name: 'credit_id')
  String creditId;
  PaymentMixin$Credit credit;
}
mixin NotificationMixin {
  @JsonKey(name: '__typename')
  String $$typename;
  String id;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  String message;
  bool delivered;
  NotificationMixin$Credit credit;
}

@JsonSerializable(explicitToJson: true)
class UpdateUser$MutationRoot$User with EquatableMixin, UserMixin {
  UpdateUser$MutationRoot$User();

  factory UpdateUser$MutationRoot$User.fromJson(Map<String, dynamic> json) =>
      _$UpdateUser$MutationRoot$UserFromJson(json);

  @override
  List<Object> get props => [
        $$typename,
        id,
        createdAt,
        updatedAt,
        displayName,
        avatarUrl,
        phoneNumber,
        fullName,
        city,
        address
      ];
  Map<String, dynamic> toJson() => _$UpdateUser$MutationRoot$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUser$MutationRoot with EquatableMixin {
  UpdateUser$MutationRoot();

  factory UpdateUser$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$UpdateUser$MutationRootFromJson(json);

  UpdateUser$MutationRoot$User user;

  @override
  List<Object> get props => [user];
  Map<String, dynamic> toJson() => _$UpdateUser$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UsersSetInput with EquatableMixin {
  UsersSetInput(
      {this.address,
      this.avatarUrl,
      this.city,
      this.displayName,
      this.fullName,
      this.phoneNumber});

  factory UsersSetInput.fromJson(Map<String, dynamic> json) =>
      _$UsersSetInputFromJson(json);

  String address;

  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  String city;

  @JsonKey(name: 'display_name')
  String displayName;

  @JsonKey(name: 'full_name')
  String fullName;

  @JsonKey(name: 'phone_number')
  String phoneNumber;

  @override
  List<Object> get props =>
      [address, avatarUrl, city, displayName, fullName, phoneNumber];
  Map<String, dynamic> toJson() => _$UsersSetInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddApplication$MutationRoot$Credit with EquatableMixin, CreditMixin {
  AddApplication$MutationRoot$Credit();

  factory AddApplication$MutationRoot$Credit.fromJson(
          Map<String, dynamic> json) =>
      _$AddApplication$MutationRoot$CreditFromJson(json);

  @override
  List<Object> get props => [
        $$typename,
        id,
        status,
        sum,
        term,
        nextPaymentSum,
        nextPaymentDate,
        otherPayments,
        createdAt,
        creditStatus
      ];
  Map<String, dynamic> toJson() =>
      _$AddApplication$MutationRoot$CreditToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddApplication$MutationRoot$User with EquatableMixin, UserMixin {
  AddApplication$MutationRoot$User();

  factory AddApplication$MutationRoot$User.fromJson(
          Map<String, dynamic> json) =>
      _$AddApplication$MutationRoot$UserFromJson(json);

  @override
  List<Object> get props => [
        $$typename,
        id,
        createdAt,
        updatedAt,
        displayName,
        avatarUrl,
        phoneNumber,
        fullName,
        city,
        address
      ];
  Map<String, dynamic> toJson() =>
      _$AddApplication$MutationRoot$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddApplication$MutationRoot with EquatableMixin {
  AddApplication$MutationRoot();

  factory AddApplication$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$AddApplication$MutationRootFromJson(json);

  AddApplication$MutationRoot$Credit credit;

  AddApplication$MutationRoot$User user;

  @override
  List<Object> get props => [credit, user];
  Map<String, dynamic> toJson() => _$AddApplication$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreditMixin$CreditStatus with EquatableMixin {
  CreditMixin$CreditStatus();

  factory CreditMixin$CreditStatus.fromJson(Map<String, dynamic> json) =>
      _$CreditMixin$CreditStatusFromJson(json);

  String status;

  String name;

  @override
  List<Object> get props => [status, name];
  Map<String, dynamic> toJson() => _$CreditMixin$CreditStatusToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ContactsInsertInput with EquatableMixin {
  ContactsInsertInput({this.credits, this.name, this.phoneNumber, this.whoIs});

  factory ContactsInsertInput.fromJson(Map<String, dynamic> json) =>
      _$ContactsInsertInputFromJson(json);

  CreditsArrRelInsertInput credits;

  String name;

  @JsonKey(name: 'phone_number')
  String phoneNumber;

  @JsonKey(name: 'who_is')
  String whoIs;

  @override
  List<Object> get props => [credits, name, phoneNumber, whoIs];
  Map<String, dynamic> toJson() => _$ContactsInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ContactsObjRelInsertInput with EquatableMixin {
  ContactsObjRelInsertInput({@required this.data});

  factory ContactsObjRelInsertInput.fromJson(Map<String, dynamic> json) =>
      _$ContactsObjRelInsertInputFromJson(json);

  ContactsInsertInput data;

  @override
  List<Object> get props => [data];
  Map<String, dynamic> toJson() => _$ContactsObjRelInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreditsArrRelInsertInput with EquatableMixin {
  CreditsArrRelInsertInput({@required this.data});

  factory CreditsArrRelInsertInput.fromJson(Map<String, dynamic> json) =>
      _$CreditsArrRelInsertInputFromJson(json);

  List<CreditsInsertInput> data;

  @override
  List<Object> get props => [data];
  Map<String, dynamic> toJson() => _$CreditsArrRelInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreditsInsertInput with EquatableMixin {
  CreditsInsertInput(
      {this.autoInfo,
      this.cardNumber,
      this.contact,
      this.documents,
      this.monthlyProfit,
      this.otherPayments,
      this.requestSum,
      this.requestTerm,
      this.work});

  factory CreditsInsertInput.fromJson(Map<String, dynamic> json) =>
      _$CreditsInsertInputFromJson(json);

  @JsonKey(name: 'auto_info')
  String autoInfo;

  @JsonKey(name: 'card_number')
  String cardNumber;

  ContactsObjRelInsertInput contact;

  DocumentsArrRelInsertInput documents;

  @JsonKey(name: 'monthly_profit')
  double monthlyProfit;

  @JsonKey(name: 'other_payments')
  double otherPayments;

  @JsonKey(name: 'request_sum')
  double requestSum;

  @JsonKey(name: 'request_term')
  int requestTerm;

  WorksObjRelInsertInput work;

  @override
  List<Object> get props => [
        autoInfo,
        cardNumber,
        contact,
        documents,
        monthlyProfit,
        otherPayments,
        requestSum,
        requestTerm,
        work
      ];
  Map<String, dynamic> toJson() => _$CreditsInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreditsObjRelInsertInput with EquatableMixin {
  CreditsObjRelInsertInput({@required this.data});

  factory CreditsObjRelInsertInput.fromJson(Map<String, dynamic> json) =>
      _$CreditsObjRelInsertInputFromJson(json);

  CreditsInsertInput data;

  @override
  List<Object> get props => [data];
  Map<String, dynamic> toJson() => _$CreditsObjRelInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DocumentsArrRelInsertInput with EquatableMixin {
  DocumentsArrRelInsertInput({@required this.data});

  factory DocumentsArrRelInsertInput.fromJson(Map<String, dynamic> json) =>
      _$DocumentsArrRelInsertInputFromJson(json);

  List<DocumentsInsertInput> data;

  @override
  List<Object> get props => [data];
  Map<String, dynamic> toJson() => _$DocumentsArrRelInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DocumentsInsertInput with EquatableMixin {
  DocumentsInsertInput({this.credit, this.creditId, this.file, this.type});

  factory DocumentsInsertInput.fromJson(Map<String, dynamic> json) =>
      _$DocumentsInsertInputFromJson(json);

  CreditsObjRelInsertInput credit;

  @JsonKey(name: 'credit_id')
  String creditId;

  String file;

  @JsonKey(unknownEnumValue: DocumentTypeEnum.artemisUnknown)
  DocumentTypeEnum type;

  @override
  List<Object> get props => [credit, creditId, file, type];
  Map<String, dynamic> toJson() => _$DocumentsInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WorksInsertInput with EquatableMixin {
  WorksInsertInput(
      {this.address, this.credits, this.inn, this.name, this.phoneNumber});

  factory WorksInsertInput.fromJson(Map<String, dynamic> json) =>
      _$WorksInsertInputFromJson(json);

  String address;

  CreditsArrRelInsertInput credits;

  String inn;

  String name;

  @JsonKey(name: 'phone_number')
  String phoneNumber;

  @override
  List<Object> get props => [address, credits, inn, name, phoneNumber];
  Map<String, dynamic> toJson() => _$WorksInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WorksObjRelInsertInput with EquatableMixin {
  WorksObjRelInsertInput({@required this.data});

  factory WorksObjRelInsertInput.fromJson(Map<String, dynamic> json) =>
      _$WorksObjRelInsertInputFromJson(json);

  WorksInsertInput data;

  @override
  List<Object> get props => [data];
  Map<String, dynamic> toJson() => _$WorksObjRelInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetOffices$QueryRoot$Offices with EquatableMixin, OfficeMixin {
  GetOffices$QueryRoot$Offices();

  factory GetOffices$QueryRoot$Offices.fromJson(Map<String, dynamic> json) =>
      _$GetOffices$QueryRoot$OfficesFromJson(json);

  @override
  List<Object> get props =>
      [$$typename, id, workTime, workDays, address, phoneNumber, coordinates];
  Map<String, dynamic> toJson() => _$GetOffices$QueryRoot$OfficesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetOffices$QueryRoot with EquatableMixin {
  GetOffices$QueryRoot();

  factory GetOffices$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetOffices$QueryRootFromJson(json);

  List<GetOffices$QueryRoot$Offices> offices;

  @override
  List<Object> get props => [offices];
  Map<String, dynamic> toJson() => _$GetOffices$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentUser$QueryRoot$User with EquatableMixin, UserMixin {
  GetCurrentUser$QueryRoot$User();

  factory GetCurrentUser$QueryRoot$User.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUser$QueryRoot$UserFromJson(json);

  @override
  List<Object> get props => [
        $$typename,
        id,
        createdAt,
        updatedAt,
        displayName,
        avatarUrl,
        phoneNumber,
        fullName,
        city,
        address
      ];
  Map<String, dynamic> toJson() => _$GetCurrentUser$QueryRoot$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentUser$QueryRoot with EquatableMixin {
  GetCurrentUser$QueryRoot();

  factory GetCurrentUser$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUser$QueryRootFromJson(json);

  GetCurrentUser$QueryRoot$User user;

  @override
  List<Object> get props => [user];
  Map<String, dynamic> toJson() => _$GetCurrentUser$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentUser$SubscriptionRoot$User with EquatableMixin, UserMixin {
  CurrentUser$SubscriptionRoot$User();

  factory CurrentUser$SubscriptionRoot$User.fromJson(
          Map<String, dynamic> json) =>
      _$CurrentUser$SubscriptionRoot$UserFromJson(json);

  @override
  List<Object> get props => [
        $$typename,
        id,
        createdAt,
        updatedAt,
        displayName,
        avatarUrl,
        phoneNumber,
        fullName,
        city,
        address
      ];
  Map<String, dynamic> toJson() =>
      _$CurrentUser$SubscriptionRoot$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentUser$SubscriptionRoot with EquatableMixin {
  CurrentUser$SubscriptionRoot();

  factory CurrentUser$SubscriptionRoot.fromJson(Map<String, dynamic> json) =>
      _$CurrentUser$SubscriptionRootFromJson(json);

  CurrentUser$SubscriptionRoot$User user;

  @override
  List<Object> get props => [user];
  Map<String, dynamic> toJson() => _$CurrentUser$SubscriptionRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Credits$SubscriptionRoot$Credits$Payments
    with EquatableMixin, PaymentMixin {
  Credits$SubscriptionRoot$Credits$Payments();

  factory Credits$SubscriptionRoot$Credits$Payments.fromJson(
          Map<String, dynamic> json) =>
      _$Credits$SubscriptionRoot$Credits$PaymentsFromJson(json);

  @override
  List<Object> get props => [$$typename, id, createdAt, sum, creditId, credit];
  Map<String, dynamic> toJson() =>
      _$Credits$SubscriptionRoot$Credits$PaymentsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Credits$SubscriptionRoot$Credits with EquatableMixin, CreditMixin {
  Credits$SubscriptionRoot$Credits();

  factory Credits$SubscriptionRoot$Credits.fromJson(
          Map<String, dynamic> json) =>
      _$Credits$SubscriptionRoot$CreditsFromJson(json);

  List<Credits$SubscriptionRoot$Credits$Payments> payments;

  @override
  List<Object> get props => [
        $$typename,
        id,
        status,
        sum,
        term,
        nextPaymentSum,
        nextPaymentDate,
        otherPayments,
        createdAt,
        creditStatus,
        payments
      ];
  Map<String, dynamic> toJson() =>
      _$Credits$SubscriptionRoot$CreditsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Credits$SubscriptionRoot with EquatableMixin {
  Credits$SubscriptionRoot();

  factory Credits$SubscriptionRoot.fromJson(Map<String, dynamic> json) =>
      _$Credits$SubscriptionRootFromJson(json);

  List<Credits$SubscriptionRoot$Credits> credits;

  @override
  List<Object> get props => [credits];
  Map<String, dynamic> toJson() => _$Credits$SubscriptionRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaymentMixin$Credit with EquatableMixin {
  PaymentMixin$Credit();

  factory PaymentMixin$Credit.fromJson(Map<String, dynamic> json) =>
      _$PaymentMixin$CreditFromJson(json);

  @JsonKey(name: '__typename')
  String $$typename;

  String id;

  @override
  List<Object> get props => [$$typename, id];
  Map<String, dynamic> toJson() => _$PaymentMixin$CreditToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Notifications$SubscriptionRoot$Notifications
    with EquatableMixin, NotificationMixin {
  Notifications$SubscriptionRoot$Notifications();

  factory Notifications$SubscriptionRoot$Notifications.fromJson(
          Map<String, dynamic> json) =>
      _$Notifications$SubscriptionRoot$NotificationsFromJson(json);

  @override
  List<Object> get props =>
      [$$typename, id, createdAt, message, delivered, credit];
  Map<String, dynamic> toJson() =>
      _$Notifications$SubscriptionRoot$NotificationsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Notifications$SubscriptionRoot with EquatableMixin {
  Notifications$SubscriptionRoot();

  factory Notifications$SubscriptionRoot.fromJson(Map<String, dynamic> json) =>
      _$Notifications$SubscriptionRootFromJson(json);

  List<Notifications$SubscriptionRoot$Notifications> notifications;

  @override
  List<Object> get props => [notifications];
  Map<String, dynamic> toJson() => _$Notifications$SubscriptionRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NotificationMixin$Credit with EquatableMixin, CreditMixin {
  NotificationMixin$Credit();

  factory NotificationMixin$Credit.fromJson(Map<String, dynamic> json) =>
      _$NotificationMixin$CreditFromJson(json);

  @override
  List<Object> get props => [
        $$typename,
        id,
        status,
        sum,
        term,
        nextPaymentSum,
        nextPaymentDate,
        otherPayments,
        createdAt,
        creditStatus
      ];
  Map<String, dynamic> toJson() => _$NotificationMixin$CreditToJson(this);
}

enum CreditStatusEnum {
  @JsonValue('approved')
  approved,
  @JsonValue('denied')
  denied,
  @JsonValue('issued')
  issued,
  @JsonValue('paid')
  paid,
  @JsonValue('request')
  request,
  @JsonValue('wait_user_confirm')
  waitUserConfirm,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum DocumentTypeEnum {
  @JsonValue('auto_photo_pts')
  autoPhotoPts,
  @JsonValue('auto_photo_pts_back')
  autoPhotoPtsBack,
  @JsonValue('auto_photo_sts')
  autoPhotoSts,
  @JsonValue('auto_photo_sts_back')
  autoPhotoStsBack,
  @JsonValue('auto_photo_vin')
  autoPhotoVin,
  @JsonValue('auto_video_360')
  autoVideo360,
  @JsonValue('investor_dogovor')
  investorDogovor,
  @JsonValue('passport_photo_family')
  passportPhotoFamily,
  @JsonValue('passport_photo_first_page')
  passportPhotoFirstPage,
  @JsonValue('passport_photo_registration')
  passportPhotoRegistration,
  @JsonValue('passport_photo_registration_next_page')
  passportPhotoRegistrationNextPage,
  @JsonValue('passport_selfie')
  passportSelfie,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

@JsonSerializable(explicitToJson: true)
class UpdateUserArguments extends JsonSerializable with EquatableMixin {
  UpdateUserArguments({@required this.user, @required this.userId});

  @override
  factory UpdateUserArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserArgumentsFromJson(json);

  final UsersSetInput user;

  final String userId;

  @override
  List<Object> get props => [user, userId];
  @override
  Map<String, dynamic> toJson() => _$UpdateUserArgumentsToJson(this);
}

class UpdateUserMutation
    extends GraphQLQuery<UpdateUser$MutationRoot, UpdateUserArguments> {
  UpdateUserMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'UpdateUser'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'user')),
              type: NamedTypeNode(
                  name: NameNode(value: 'users_set_input'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'userId')),
              type:
                  NamedTypeNode(name: NameNode(value: 'uuid'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'update_users_by_pk'),
              alias: NameNode(value: 'user'),
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'pk_columns'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'id'),
                          value: VariableNode(name: NameNode(value: 'userId')))
                    ])),
                ArgumentNode(
                    name: NameNode(value: '_set'),
                    value: VariableNode(name: NameNode(value: 'user')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FragmentSpreadNode(
                    name: NameNode(value: 'User'), directives: [])
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'User'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'users'), isNonNull: false)),
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'created_at'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'updated_at'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'display_name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'avatar_url'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'phone_number'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'full_name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'city'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'address'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'UpdateUser';

  @override
  final UpdateUserArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  UpdateUser$MutationRoot parse(Map<String, dynamic> json) =>
      UpdateUser$MutationRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class AddApplicationArguments extends JsonSerializable with EquatableMixin {
  AddApplicationArguments(
      {@required this.credit, @required this.user, @required this.userId});

  @override
  factory AddApplicationArguments.fromJson(Map<String, dynamic> json) =>
      _$AddApplicationArgumentsFromJson(json);

  final CreditsInsertInput credit;

  final UsersSetInput user;

  final String userId;

  @override
  List<Object> get props => [credit, user, userId];
  @override
  Map<String, dynamic> toJson() => _$AddApplicationArgumentsToJson(this);
}

class AddApplicationMutation
    extends GraphQLQuery<AddApplication$MutationRoot, AddApplicationArguments> {
  AddApplicationMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'AddApplication'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'credit')),
              type: NamedTypeNode(
                  name: NameNode(value: 'credits_insert_input'),
                  isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'user')),
              type: NamedTypeNode(
                  name: NameNode(value: 'users_set_input'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'userId')),
              type:
                  NamedTypeNode(name: NameNode(value: 'uuid'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'insert_credits_one'),
              alias: NameNode(value: 'credit'),
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'object'),
                    value: VariableNode(name: NameNode(value: 'credit')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FragmentSpreadNode(
                    name: NameNode(value: 'Credit'), directives: [])
              ])),
          FieldNode(
              name: NameNode(value: 'update_users_by_pk'),
              alias: NameNode(value: 'user'),
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'pk_columns'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'id'),
                          value: VariableNode(name: NameNode(value: 'userId')))
                    ])),
                ArgumentNode(
                    name: NameNode(value: '_set'),
                    value: VariableNode(name: NameNode(value: 'user')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FragmentSpreadNode(
                    name: NameNode(value: 'User'), directives: [])
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'Credit'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'credits'), isNonNull: false)),
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'status'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'sum'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'term'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'next_payment_sum'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'next_payment_date'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'other_payments'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'created_at'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'credit_status'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'status'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'User'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'users'), isNonNull: false)),
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'created_at'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'updated_at'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'display_name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'avatar_url'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'phone_number'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'full_name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'city'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'address'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'AddApplication';

  @override
  final AddApplicationArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  AddApplication$MutationRoot parse(Map<String, dynamic> json) =>
      AddApplication$MutationRoot.fromJson(json);
}

class GetOfficesQuery
    extends GraphQLQuery<GetOffices$QueryRoot, JsonSerializable> {
  GetOfficesQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GetOffices'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'offices'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FragmentSpreadNode(
                    name: NameNode(value: 'Office'), directives: [])
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'Office'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'offices'), isNonNull: false)),
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'work_time'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'work_days'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'address'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'phone_number'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'coordinates'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'GetOffices';

  @override
  List<Object> get props => [document, operationName];
  @override
  GetOffices$QueryRoot parse(Map<String, dynamic> json) =>
      GetOffices$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentUserArguments extends JsonSerializable with EquatableMixin {
  GetCurrentUserArguments({@required this.userId});

  @override
  factory GetCurrentUserArguments.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUserArgumentsFromJson(json);

  final String userId;

  @override
  List<Object> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$GetCurrentUserArgumentsToJson(this);
}

class GetCurrentUserQuery
    extends GraphQLQuery<GetCurrentUser$QueryRoot, GetCurrentUserArguments> {
  GetCurrentUserQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GetCurrentUser'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'userId')),
              type:
                  NamedTypeNode(name: NameNode(value: 'uuid'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'users_by_pk'),
              alias: NameNode(value: 'user'),
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'id'),
                    value: VariableNode(name: NameNode(value: 'userId')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FragmentSpreadNode(
                    name: NameNode(value: 'User'), directives: [])
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'User'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'users'), isNonNull: false)),
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'created_at'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'updated_at'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'display_name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'avatar_url'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'phone_number'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'full_name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'city'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'address'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'GetCurrentUser';

  @override
  final GetCurrentUserArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GetCurrentUser$QueryRoot parse(Map<String, dynamic> json) =>
      GetCurrentUser$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CurrentUserArguments extends JsonSerializable with EquatableMixin {
  CurrentUserArguments({@required this.userId});

  @override
  factory CurrentUserArguments.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserArgumentsFromJson(json);

  final String userId;

  @override
  List<Object> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$CurrentUserArgumentsToJson(this);
}

class CurrentUserSubscription
    extends GraphQLQuery<CurrentUser$SubscriptionRoot, CurrentUserArguments> {
  CurrentUserSubscription({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.subscription,
        name: NameNode(value: 'CurrentUser'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'userId')),
              type:
                  NamedTypeNode(name: NameNode(value: 'uuid'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'users_by_pk'),
              alias: NameNode(value: 'user'),
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'id'),
                    value: VariableNode(name: NameNode(value: 'userId')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FragmentSpreadNode(
                    name: NameNode(value: 'User'), directives: [])
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'User'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'users'), isNonNull: false)),
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'created_at'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'updated_at'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'display_name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'avatar_url'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'phone_number'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'full_name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'city'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'address'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'CurrentUser';

  @override
  final CurrentUserArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CurrentUser$SubscriptionRoot parse(Map<String, dynamic> json) =>
      CurrentUser$SubscriptionRoot.fromJson(json);
}

class CreditsSubscription
    extends GraphQLQuery<Credits$SubscriptionRoot, JsonSerializable> {
  CreditsSubscription();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.subscription,
        name: NameNode(value: 'Credits'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'credits'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FragmentSpreadNode(
                    name: NameNode(value: 'Credit'), directives: []),
                FieldNode(
                    name: NameNode(value: 'payments'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                          name: NameNode(value: 'limit'),
                          value: IntValueNode(value: '1')),
                      ArgumentNode(
                          name: NameNode(value: 'order_by'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                                name: NameNode(value: 'created_at'),
                                value: EnumValueNode(
                                    name: NameNode(value: 'desc')))
                          ]))
                    ],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FragmentSpreadNode(
                          name: NameNode(value: 'Payment'), directives: [])
                    ]))
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'Payment'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'payments'), isNonNull: false)),
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'created_at'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'sum'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'credit_id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'credit'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'Credit'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'credits'), isNonNull: false)),
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'status'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'sum'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'term'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'next_payment_sum'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'next_payment_date'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'other_payments'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'created_at'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'credit_status'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'status'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'Credits';

  @override
  List<Object> get props => [document, operationName];
  @override
  Credits$SubscriptionRoot parse(Map<String, dynamic> json) =>
      Credits$SubscriptionRoot.fromJson(json);
}

class NotificationsSubscription
    extends GraphQLQuery<Notifications$SubscriptionRoot, JsonSerializable> {
  NotificationsSubscription();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.subscription,
        name: NameNode(value: 'Notifications'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'notifications'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FragmentSpreadNode(
                    name: NameNode(value: 'Notification'), directives: [])
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'Notification'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'notifications'), isNonNull: false)),
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'created_at'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'message'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'delivered'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'credit'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FragmentSpreadNode(
                    name: NameNode(value: 'Credit'), directives: [])
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'Credit'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'credits'), isNonNull: false)),
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'status'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'sum'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'term'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'next_payment_sum'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'next_payment_date'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'other_payments'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'created_at'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'credit_status'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'status'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'Notifications';

  @override
  List<Object> get props => [document, operationName];
  @override
  Notifications$SubscriptionRoot parse(Map<String, dynamic> json) =>
      Notifications$SubscriptionRoot.fromJson(json);
}
