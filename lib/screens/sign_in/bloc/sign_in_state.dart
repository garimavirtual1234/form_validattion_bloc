abstract class SignInState{}

class SignInInitialState extends SignInState{}

class SignInvalidState extends SignInState{}



class SignINErrorState extends SignInState{
  final String errorMessage;
  SignINErrorState(this.errorMessage);
}

class SignInLoadingState extends SignInState{}

