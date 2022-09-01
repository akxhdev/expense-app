import 'package:expense_app/exception/app_exception.dart';

class WrongPasswordException extends AppException {
  WrongPasswordException() : super("Wrong password");
}
