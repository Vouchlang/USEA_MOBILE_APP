/// ! PaymentData1
class PaymentData {
  late final String yearPayment, amountToPaid, amountPaid, balance;

  /// ! constructor
  PaymentData({
    required this.yearPayment,
    required this.amountToPaid,
    required this.amountPaid,
    required this.balance,
  });
}

List<PaymentData> paymentData = [
  PaymentData(
    yearPayment: 'ឆ្នាំទី​ ១',
    amountToPaid: '650',
    amountPaid: '650',
    balance: '0',
  ),
  PaymentData(
    yearPayment: 'ឆ្នាំទី​ ២',
    amountToPaid: '650',
    amountPaid: '650',
    balance: '0',
  ),
  PaymentData(
    yearPayment: 'ឆ្នាំទី​ ៣',
    amountToPaid: '650',
    amountPaid: '650',
    balance: '60',
  ),
  PaymentData(
    yearPayment: 'ឆ្នាំទី​ ៤',
    amountToPaid: '650',
    amountPaid: '650',
    balance: '130',
  ),
];

/// ! PaymentData2
class PaymentData2 {
  late final String datePayment2,
      invoiceNum2,
      amountToPaid2,
      amountPaid2,
      balance2;

  /// ! constructor2
  PaymentData2({
    required this.datePayment2,
    required this.invoiceNum2,
    required this.amountToPaid2,
    required this.amountPaid2,
    required this.balance2,
  });
}

List<PaymentData2> paymentData2 = [
  PaymentData2(
    datePayment2: '99/99/9999',
    invoiceNum2: 'USEAEDS999999',
    amountToPaid2: '15',
    amountPaid2: '10',
    balance2: '305',
  ),
  PaymentData2(
    datePayment2: '15/02/2023',
    invoiceNum2: 'XXXXXX',
    amountToPaid2: '10',
    amountPaid2: '10',
    balance2: '0',
  ),
];

/// ! PaymentData3
class PaymentData3 {
  late final String datePayment3,
      invoiceNum3,
      amountToPaid3,
      amountPaid3,
      balance3;

  /// ! constructor3
  PaymentData3({
    required this.datePayment3,
    required this.invoiceNum3,
    required this.amountToPaid3,
    required this.amountPaid3,
    required this.balance3,
  });
}

List<PaymentData3> paymentData3 = [
  PaymentData3(
    datePayment3: '15/02/2023',
    invoiceNum3: 'XXXXXX',
    amountToPaid3: '15',
    amountPaid3: '10',
    balance3: '350',
  ),
  PaymentData3(
    datePayment3: '15/02/2023',
    invoiceNum3: 'XXXXXX',
    amountToPaid3: '10',
    amountPaid3: '10',
    balance3: '0',
  ),
];

/// ! PaymentData4
class PaymentData4 {
  late final String datePayment4,
      invoiceNum4,
      amountToPaid4,
      amountPaid4,
      balance4;

  /// ! constructor4
  PaymentData4({
    required this.datePayment4,
    required this.invoiceNum4,
    required this.amountToPaid4,
    required this.amountPaid4,
    required this.balance4,
  });
}

List<PaymentData4> paymentData4 = [
  PaymentData4(
    datePayment4: '15/02/2023',
    invoiceNum4: 'XXXXXX',
    amountToPaid4: '15',
    amountPaid4: '10',
    balance4: '0',
  ),
  PaymentData4(
    datePayment4: '15/02/2023',
    invoiceNum4: 'XXXXXX',
    amountToPaid4: '10',
    amountPaid4: '10',
    balance4: '320',
  ),
];

// class PayStudy {
//   final String yearName;
//   final List<Payment> payments;

//   PayStudy({
//     required this.yearName,
//     required this.payments,
//   });

//   factory PayStudy.fromJson(Map<String, dynamic> json) {
//     List<Payment> payments = List<Payment>.from(
//         json['payment_list'].map((x) => Payment.fromJson(x)));
//     return PayStudy(
//       yearName: json['year_name'],
//       payments: payments,
//     );
//   }
// }

// class Payment {
//   final String invoiceNum;
//   final String pdate;
//   final String moneyPay;
//   final String moneyPaid;
//   final String moneyRem;

//   Payment({
//     required this.invoiceNum,
//     required this.pdate,
//     required this.moneyPay,
//     required this.moneyPaid,
//     required this.moneyRem,
//   });

//   factory Payment.fromJson(Map<String, dynamic> json) {
//     return Payment(
//       invoiceNum: json['invoice_num'],
//       pdate: json['pdate'],
//       moneyPay: json['money_pay'],
//       moneyPaid: json['money_paid'],
//       moneyRem: json['money_rem'],
//     );
//   }
// }

// // ReExam Study Payment
// class ReExamStudyClass {
//   final String re_invoice;
//   final String re_pdate;
//   final String re_money_pay;
//   final String re_money_paid;
//   final String re_money_rem;

//   ReExamStudyClass(
//       {required this.re_pdate,
//       required this.re_invoice,
//       required this.re_money_pay,
//       required this.re_money_paid,
//       required this.re_money_rem});

//   factory ReExamStudyClass.fromJson(Map<String, dynamic> json) {
//     return ReExamStudyClass(
//       re_pdate: json['re_pdate'],
//       re_invoice: json['re_invoice'],
//       re_money_pay: json['re_money_pay'],
//       re_money_paid: json['re_money_paid'],
//       re_money_rem: json['re_money_rem'],
//     );
//   }
// }

// // Credit Payment
// class CreditPayClass {
//   final String c_invoice;
//   final String c_pdate;
//   final String c_money_pay;
//   final String c_money_paid;
//   final String c_money_rem;

//   CreditPayClass(
//       {required this.c_pdate,
//       required this.c_invoice,
//       required this.c_money_pay,
//       required this.c_money_paid,
//       required this.c_money_rem});

//   factory CreditPayClass.fromJson(Map<String, dynamic> json) {
//     return CreditPayClass(
//       c_pdate: json['c_pdate'],
//       c_invoice: json['c_invoice'],
//       c_money_pay: json['c_money_pay'],
//       c_money_paid: json['c_money_paid'],
//       c_money_rem: json['c_money_rem'],
//     );
//   }
// }

// // Other Payment
// class OtherPayClass {
//   final String o_invoice;
//   final String o_pdate;
//   final String o_money_pay;
//   final String o_money_paid;
//   final String o_money_rem;

//   OtherPayClass(
//       {required this.o_pdate,
//       required this.o_invoice,
//       required this.o_money_pay,
//       required this.o_money_paid,
//       required this.o_money_rem});

//   factory OtherPayClass.fromJson(Map<String, dynamic> json) {
//     return OtherPayClass(
//       o_pdate: json['o_pdate'],
//       o_invoice: json['o_invoice'],
//       o_money_pay: json['o_money_pay'],
//       o_money_paid: json['o_money_paid'],
//       o_money_rem: json['o_money_rem'],
//     );
//   }
// }
