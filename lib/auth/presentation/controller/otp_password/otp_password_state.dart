
abstract class OtpPasswordStates {}

class OtpPasswordInitialState extends OtpPasswordStates {}

class OtpLoadingState extends OtpPasswordStates {}

class OtpSuccessState extends OtpPasswordStates
{
}

class OtpErrorState extends OtpPasswordStates
{
  final String error;

  OtpErrorState(this.error);
}