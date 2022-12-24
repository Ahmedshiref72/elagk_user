import 'package:elagk/auth/data/models/register_model/register_model.dart';

import '../../../data/models/login_model/login_model.dart';


abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates
{

  // final RegisterModel registerModel;
  //
  // RegisterSuccessState(this.registerModel);
}

class RegisterErrorState extends RegisterStates
{
  final String error;

  RegisterErrorState(this.error);
}


class SendOTPLoadingState extends RegisterStates {}

class SendOTPSuccessState extends RegisterStates
{
  final LoginModel loginModel;

  SendOTPSuccessState(this.loginModel);

}

class SendOTPErrorState extends RegisterStates
{
  final String error;

  SendOTPErrorState(this.error);
}

