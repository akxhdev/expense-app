import 'package:expense_app/exception/app_exception.dart';

class UserNotFoundException extends AppException {
  UserNotFoundException() : super("User account not found");
}
