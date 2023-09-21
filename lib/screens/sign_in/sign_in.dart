import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_using_bloc/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:form_validation_using_bloc/screens/sign_in/bloc/sign_in_event.dart';
import 'package:form_validation_using_bloc/screens/sign_in/bloc/sign_in_state.dart';


class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    title: const Text("SigIn"),
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<SignInBloc,SignInState>(
            builder: (context,state) {
              if(state is SignINErrorState) {
                return  Text(state.errorMessage,
                style: const TextStyle(color: Colors.red),
                );
              }else{
                return Container();
              }
            }
          ),
        TextField(
          controller: emailController,
            onChanged: (value){
             BlocProvider.of<SignInBloc>(context).add(
                 SignInTextChangeEvent(emailController.text, passwordController.text));
            },
            decoration: const InputDecoration(
              hintText: "Email Address"
            ),
          ),
      TextField(
            controller: passwordController,
            onChanged: (value){
              BlocProvider.of<SignInBloc>(context).add(
                  SignInTextChangeEvent(emailController.text, passwordController.text));
            },
            decoration: const InputDecoration(
                hintText: "Password"
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: BlocBuilder<SignInBloc,SignInState>(
              builder: (context,state) {
               if(state is SignInLoadingState){
                 return const CircularProgressIndicator();
               }
               else{
                 return InkWell(
                   onTap: (){
                     if(state is SignInvalidState){
                       BlocProvider.of<SignInBloc>(context).add(
                        SignInSubmittedEvent(emailController.text, passwordController.text)
                       );
                     }
                   },
                   child: Container(
                       width: 200,
                       height: 40,
                       decoration:  BoxDecoration(
                           color: state is SignInvalidState? Colors.green:Colors.grey,
                           borderRadius: BorderRadius.circular(5)
                       ),
                       child: const Center(child: Text("SignIn"))
                   ),
                 );
               }
              }
            ),
          )
        ],
      ),
    );
  }
}
