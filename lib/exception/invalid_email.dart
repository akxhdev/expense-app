import 'package:expense_app/exception/app_exception.dart';

class InvalidEmailException extends AppException {
  InvalidEmailException() : super("Invalid Email");
}
