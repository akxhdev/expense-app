import 'package:expense_app/exception/app_exception.dart';

class UserDisabledException extends AppException {
  UserDisabledException() : super("User account is disabled");
}
