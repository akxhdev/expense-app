import 'dart:convert';

class Expense {
  final String id;
  final String categoryId;
  final String fromWalletId;
  final String toWalletId;
  final String userId;
  final double amount;
  final String comment;

  Expense({
    required this.id,
    required this.categoryId,
    required this.fromWalletId,
    required this.toWalletId,
    required this.userId,
    required this.amount,
    required this.comment,
  });

  Expense copyWith({
    String? id,
    String? categoryId,
    String? fromWalletId,
    String? toWalletId,
    String? userId,
    double? amount,
    String? comment,
  }) {
    return Expense(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      fromWalletId: fromWalletId ?? this.fromWalletId,
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
      'fromWalletId': fromWalletId,
      'toWalletId': toWalletId,
      'userId': userId,
      'amount': amount,
      'comment': comment,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'] ?? '',
      categoryId: map['categoryId'] ?? '',
      fromWalletId: map['fromWalletId'] ?? '',
      toWalletId: map['toWalletId'] ?? '',
      userId: map['userId'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      comment: map['comment'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Expense.fromJson(String source) =>
      Expense.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Expense(id: $id, categoryId: $categoryId, fromWalletId: $fromWalletId, toWalletId: $toWalletId, userId: $userId, amount: $amount, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Expense &&
        other.id == id &&
        other.categoryId == categoryId &&
        other.fromWalletId == fromWalletId &&
        other.toWalletId == toWalletId &&
        other.userId == userId &&
        other.amount == amount &&
        other.comment == comment;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categoryId.hashCode ^
        fromWalletId.hashCode ^
        toWalletId.hashCode ^
        userId.hashCode ^
        amount.hashCode ^
        comment.hashCode;
  }
}
