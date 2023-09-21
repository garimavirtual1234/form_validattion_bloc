
import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:form_validation_using_bloc/screens/sign_in/bloc/sign_in_event.dart';
import 'package:form_validation_using_bloc/screens/sign_in/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent,SignInState>{
SignInBloc() : super(SignInInitialState()){
  on<SignInTextChangeEvent>((event,emit){
    if(EmailValidator.validate(event.email)==false){
    emit(SignINErrorState("Please enter a valid email address"));
    }else if (event.password.length < 8){
      emit(SignINErrorState("Please Enter a valid password"));
    }
    else{
      emit(SignInvalidState());
    }
  });

  on<SignInSubmittedEvent>((event,emit){
emit(SignInLoadingState());
  });


}
}