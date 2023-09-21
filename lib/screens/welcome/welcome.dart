


import 'package:flutter/material.dart';
import 'package:form_validation_using_bloc/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:form_validation_using_bloc/screens/sign_in/sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Center(child: Text("Bloc demo")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=>
           BlocProvider(
              create:(context) => SignInBloc(),
              child:  SignInScreen()
            ))
            );
          },
              child: const Text("Sign in "),),
          ],
        ),
      )
      ),
    );
  }
}
