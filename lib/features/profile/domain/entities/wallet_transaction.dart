import 'package:inblue_mobile/core/utils/json_coercion.dart';

class WalletTransaction {
  WalletTransaction({
    this.id,
    this.amount = 0,
    this.description,
    this.transactionCode,
    this.createdAt,
    this.isIncoming = true,
    this.currentBalance,
    this.paymentPurpose,
    this.status,
  });

  final int? id;
  final double amount;
  final String? description;
  final String? transactionCode;
  final String? createdAt;
  final bool isIncoming;
  final double? currentBalance;
  final String? paymentPurpose;
  final String? status;

  factory WalletTransaction.fromJson(Map<String, dynamic> json) =>
      WalletTransaction(
        id: JsonCoercion.asInt(json['id']),
        amount: JsonCoercion.asDouble(json['amount']) ?? 0,
        description: json['description'] as String?,
        transactionCode: json['transactionCode'] as String?,
        createdAt: json['createdAt'] as String?,
        isIncoming: json['transactionType'] == true ||
            JsonCoercion.asBool(json['transactionType']) == true,
        currentBalance: JsonCoercion.asDouble(json['currentBalance']),
        paymentPurpose: json['paymentPurpose'] as String?,
        status: json['status'] as String?,
      );

  bool get shouldHideFromHistory {
    final purpose = paymentPurpose?.toUpperCase() ?? '';
    return purpose == 'UNKNOWN' &&
        (description == null || description!.trim().isEmpty) &&
        (currentBalance == null || currentBalance == 0);
  }
}
