// import 'package:bibimoney/graphql/api.graphql.dart';

// class Credit with CreditsMixin {
//   final Function btnOneFunc;
//   final Function btnTwoFunc;

//   Credit(GetCredits$QueryRoot$Credits credit,
//       {this.btnOneFunc, this.btnTwoFunc}) {
//     this.status = credit.status;
//     this.createdAt = credit.createdAt;
//     this.sum = credit.sum;
//     this.nextPaymentDate = credit.nextPaymentDate;
//     this.nextPaymentSum = credit.nextPaymentSum;
//     this.creditStatus = credit.creditStatus;
//     this.id = credit.id;
//     this.otherPayments = credit.otherPayments;
//     this.term = credit.term;
//     this.payments = credit.payments;
//   }

//   String getStatusString() {
//     switch (this.status) {
//       case CreditStatusEnum.request:
//         return 'request';
//       case CreditStatusEnum.approved:
//         return 'approved';
//       case CreditStatusEnum.waitUserConfirm:
//         return 'wait_user_confirm';
//       case CreditStatusEnum.issued:
//         return 'issued';
//       case CreditStatusEnum.paid:
//         return 'paid';
//       case CreditStatusEnum.denied:
//         return 'denied';
//       default:
//         return '';
//     }
//   }
// }
