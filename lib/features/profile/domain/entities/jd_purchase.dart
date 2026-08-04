class JdPurchase {
  const JdPurchase({
    this.id,
    this.status,
    this.purchasedAt,
    this.usedAt,
    this.validUntil,
    this.jobTitle,
    this.companyName,
    this.companyLogoUrl,
    this.amount,
    this.paymentMethod,
    this.transactionCode,
  });

  final int? id;
  final String? status;
  final String? purchasedAt;
  final String? usedAt;
  final String? validUntil;
  final String? jobTitle;
  final String? companyName;
  final String? companyLogoUrl;
  final int? amount;
  final String? paymentMethod;
  final String? transactionCode;

  factory JdPurchase.fromJson(Map<String, dynamic> json) {
    final jd = json['jobDescription'] as Map<String, dynamic>?;
    final payment = json['payment'] as Map<String, dynamic>?;

    return JdPurchase(
      id: json['id'] as int?,
      status: json['status'] as String?,
      purchasedAt: json['purchasedAt']?.toString(),
      usedAt: json['usedAt']?.toString(),
      validUntil: json['validUntil']?.toString(),
      jobTitle: jd?['title'] as String?,
      companyName: jd?['companyName'] as String?,
      companyLogoUrl: jd?['thumbnailUrl'] as String?,
      amount: payment?['amount'] as int?,
      paymentMethod: payment?['method'] as String?,
      transactionCode: payment?['id'] != null ? '#${payment!['id']}' : null,
    );
  }
}
