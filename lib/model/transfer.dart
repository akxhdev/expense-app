import 'dart:convert';

class Transfer {
  final String id;
  final String fromWalletId;
  final String toWalletId;
  final String userId;
  final double amount;
  final String comment;

  Transfer({
    required this.id,
    required this.fromWalletId,
    required this.toWalletId,
    required this.userId,
    required this.amount,
    required this.comment,
  });

  Transfer copyWith({
    String? id,
    String? fromWalletId,
    String? toWalletId,
    String? userId,
    double? amount,
    String? comment,
  }) {
    return Transfer(
      id: id ?? this.id,
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
      'fromWalletId': fromWalletId,
      'toWalletId': toWalletId,
      'userId': userId,
      'amount': amount,
      'comment': comment,
    };
  }

  factory Transfer.fromMap(Map<String, dynamic> map) {
    return Transfer(
      id: map['id'] ?? '',
      fromWalletId: map['fromWalletId'] ?? '',
      toWalletId: map['toWalletId'] ?? '',
      userId: map['userId'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      comment: map['comment'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Transfer.fromJson(String source) =>
      Transfer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Transfer(id: $id, fromWalletId: $fromWalletId, toWalletId: $toWalletId, userId: $userId, amount: $amount, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transfer &&
        other.id == id &&
        other.fromWalletId == fromWalletId &&
        other.toWalletId == toWalletId &&
        other.userId == userId &&
        other.amount == amount &&
        other.comment == comment;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fromWalletId.hashCode ^
        toWalletId.hashCode ^
        userId.hashCode ^
        amount.hashCode ^
        comment.hashCode;
  }
}
