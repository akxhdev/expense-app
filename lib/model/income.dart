import 'dart:convert';

class Income {
  final String id;
  final String categoryId;
  final String toWalletId;
  final String userId;
  final double amount;
  final String comment;

  Income({
    required this.id,
    required this.categoryId,
    required this.toWalletId,
    required this.userId,
    required this.amount,
    required this.comment,
  });

  Income copyWith({
    String? id,
    String? categoryId,
    String? toWalletId,
    String? userId,
    double? amount,
    String? comment,
  }) {
    return Income(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      toWalletId: toWalletId ?? this.toWalletId,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'toWalletId': toWalletId,
      'userId': userId,
      'amount': amount,
      'comment': comment,
    };
  }

  factory Income.fromMap(Map<String, dynamic> map) {
    return Income(
      id: map['id'] ?? '',
      categoryId: map['categoryId'] ?? '',
      toWalletId: map['toWalletId'] ?? '',
      userId: map['userId'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      comment: map['comment'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Income.fromJson(String source) => Income.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Income(id: $id, categoryId: $categoryId, toWalletId: $toWalletId, userId: $userId, amount: $amount, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Income &&
        other.id == id &&
        other.categoryId == categoryId &&
        other.toWalletId == toWalletId &&
        other.userId == userId &&
        other.amount == amount &&
        other.comment == comment;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categoryId.hashCode ^
        toWalletId.hashCode ^
        userId.hashCode ^
        amount.hashCode ^
        comment.hashCode;
  }
}
