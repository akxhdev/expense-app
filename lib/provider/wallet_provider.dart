import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_app/exception/wallet_service_exception.dart';
import 'package:expense_app/model/wallet.dart';
import 'package:flutter/material.dart';

class WalletProvider with ChangeNotifier {
  final FirebaseFirestore _db;
  final _collection = "wallets";

  late final CollectionReference<Wallet> _collectionRef;

  WalletProvider(this._db) {
    _collectionRef = _db.collection(_collection).withConverter(
        fromFirestore: Wallet.fromFirestore,
        toFirestore: (Wallet wallet, options) => wallet.toFirestore());
  }

  // get wallets by userId
  Future<List<Wallet>> getWallets(String userId) async {
    var querySnapshot =
        await _collectionRef.where('userId', isEqualTo: userId).get();

    var wallets = querySnapshot.docs.map((e) => e.data()).toList();

    return wallets;
  }

  // get wallet by id
  Future<Wallet> getWallet(String walletId) async {
    var docRef = _collectionRef.doc(walletId);
    var docSnap = await docRef.get();

    var wallet = docSnap.data();

    if (wallet == null) {
      throw WalletServiceException(
          WalletServiceException.UNABLE_TO_FIND_WALLET);
    }

    return wallet;
  }

  // add wallet
  Future<Wallet> addWallet(String userId, Wallet data) async {
    var docRef = await _collectionRef.add(data);
    var docSnap = await docRef.get();

    var wallet = docSnap.data();

    if (wallet == null) {
      throw WalletServiceException(WalletServiceException.UNABLE_TO_ADD_WALLET);
    }

    return wallet;
  }

  // update wallet
  Future<Wallet> updateWallet(String userId, Wallet data) async {
    var docRef = _collectionRef.doc(data.id);

    try {
      await docRef.update(data.toFirestore());
    } catch (e) {
      WalletServiceException(WalletServiceException.UNABLE_TO_UPDATE_WALLET);
    }

    return data;
  }

  // delete wallet
  Future<void> deleteWallet(String walletId) async {
    var docRef = _collectionRef.doc(walletId);

    try {
      await docRef.delete();
    } catch (e) {
      WalletServiceException(WalletServiceException.UNABLE_TO_DELETE_WALLET);
    }
  }
}
