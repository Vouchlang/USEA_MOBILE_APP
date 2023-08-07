class Credit_Class {
  final String totalCredit, yourCredit;

  Credit_Class({
    required this.totalCredit,
    required this.yourCredit,
  });

  factory Credit_Class.fromJson(Map<String, dynamic> json) {
    return Credit_Class(
      totalCredit: json['total_credit'],
      yourCredit: json['your_credit'],
    );
  }
}
