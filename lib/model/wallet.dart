import 'package:cloud_firestore/cloud_firestore.dart';

class Wallet {
  final String? id;
  final String name;
  final double balance;
  final String userId;

  Wallet({
    this.id,
    required this.name,
    required this.balance,
    required this.userId,
  });

  Wallet copyWith({
    String? id,
    String? name,
    double? balance,
    String? userId,
  }) {
    return Wallet(
      id: id ?? this.id,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'balance': balance,
      'userId': userId,
    };
  }

  factory Wallet.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final map = snapshot.data();

    return Wallet(
      id: snapshot.id,
      name: map?['name'] ?? '',
      balance: map?['balance']?.toDouble() ?? 0.0,
      userId: map?['userId'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Wallet(id: $id, name: $name, balance: $balance, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Wallet &&
        other.id == id &&
        other.name == name &&
        other.balance == balance &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ balance.hashCode ^ userId.hashCode;
  }
}
