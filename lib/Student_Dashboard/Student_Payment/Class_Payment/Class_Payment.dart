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

class PayStudy {
  final String yearName, moneyPay;
  final List<Payment> payments;

  PayStudy({
    required this.yearName,
    required this.moneyPay,
    required this.payments,
  });

  factory PayStudy.fromJson(Map<String, dynamic> json) {
    List<Payment> payments =
        List<Payment>.from(json['invoices'].map((x) => Payment.fromJson(x)));
    return PayStudy(
      yearName: json['year'].toString(),
      moneyPay: json['finalprice'].toString(),
      payments: payments,
    );
  }
}

class Payment {
  final String invoiceNum, pdate, moneyPaid, moneyRem;

  Payment({
    required this.invoiceNum,
    required this.pdate,
    required this.moneyPaid,
    required this.moneyRem,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      invoiceNum: json['invoice_num'] ?? '',
      pdate: json['pdate'] ?? '',
      moneyPaid: json['money_paid'],
      moneyRem: json['money_rem'] ?? '',
    );
  }
}

class OtherPayClass {
  final String o_invoice, o_pdate, o_money_pay, o_money_paid, o_money_rem;

  OtherPayClass({
    required this.o_pdate,
    required this.o_invoice,
    required this.o_money_pay,
    required this.o_money_paid,
    required this.o_money_rem,
  });

  factory OtherPayClass.fromJson(Map<String, dynamic> json) {
    return OtherPayClass(
      o_pdate: json['o_pdate'],
      o_invoice: json['o_invoice'],
      o_money_pay: json['o_money_pay'],
      o_money_paid: json['o_money_paid'],
      o_money_rem: json['o_money_rem'],
    );
  }
}
