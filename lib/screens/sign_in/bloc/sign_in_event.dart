abstract class SignInEvent{}

class SignInTextChangeEvent extends SignInEvent{
  final String email;
  final String password;
  SignInTextChangeEvent(this.email,this.password);
}

class SignInSubmittedEvent extends SignInEvent{
  final String email;
  final String password;
  SignInSubmittedEvent(this.email,this.password);
}