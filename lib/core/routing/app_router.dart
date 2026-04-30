
import 'package:docdoc_app/core/routing/routes.dart';
import 'package:docdoc_app/features/login/ui/login_screen.dart';
import 'package:docdoc_app/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {

  Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.onBoardingScreen :
      return MaterialPageRoute(
        builder: (context)=>OnboardingScreen());
      case Routes.loginScreen :
      return MaterialPageRoute(
        builder: (context)=>LoginScreen());  
      default:
        return MaterialPageRoute(
        builder: (context)=> Scaffold(
          body: Center( 
            child: Text('No route defined for ${settings.name}'),
          ),
        ));
    }
  }
}