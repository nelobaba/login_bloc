import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return Provider( // scope bloc to MaterialApp Widget
      child: MaterialApp(
        title: 'Log Me In!',
        home: Scaffold(
          body: LoginScreen(),
          appBar: AppBar(
            title: Text('Welcome to Bloc Login Screen App')
          ),
        ),
      )
    );
  }
}