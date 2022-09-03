import 'package:expense_app/exception/app_exception.dart';

class WalletServiceException extends AppException {
  static const UNABLE_TO_ADD_WALLET = "UNABLE_TO_ADD_WALLET";
  static const UNABLE_TO_DELETE_WALLET = "UNABLE_TO_DELETE_WALLET";
  static const UNABLE_TO_UPDATE_WALLET = "UNABLE_TO_UPDATE_WALLET";
  static const UNABLE_TO_FIND_WALLET = "UNABLE_TO_FIND_WALLET";

  WalletServiceException(super.message);
}
