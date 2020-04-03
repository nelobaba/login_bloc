import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    final bloc = Provider.of(context); // added for scoped bloc

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),

          // emailField(), 
          // passwordField(),
          Container(margin: EdgeInsets.only(top: 25.0)),
          submitButton(bloc)
        ]
      )
    );
  }

    // scoped instance of bloc, scoped to MaterialApp Widget
    Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email, //returns an email that has been validated by our emailValidator, could hold data or error
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail, // references sink.add, which passes it to the transformer and the process is repeated for new vslues as user enters more character 
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: snapshot.error
          ),
        );
      }
    );
  }

   Widget passwordField(Bloc bloc) {
     return StreamBuilder(
       stream: bloc.password,
       builder: (context, snapshot) {
         return TextField(
          onChanged: bloc.changePassword, // references sink.add, which passes it to the transformer and the process is repeated for new vslues as user enters more character 
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            errorText: snapshot.error
          ),
        );
      }
     );
  }


// single global instance of bloc
  // Widget emailField() {
  //   return StreamBuilder(
  //     stream: bloc.email, //returns an email that has been validated by our emailValidator, could hold data or error
  //     builder: (context, snapshot) {
  //       return TextField(
  //         onChanged: bloc.changeEmail, // references sink.add, which passes it to the transformer and the process is repeated for new vslues as user enters more character 
  //         keyboardType: TextInputType.emailAddress,
  //         decoration: InputDecoration(
  //           hintText: 'you@example.com',
  //           labelText: 'Email Address',
  //           errorText: snapshot.error
  //         ),
  //       );
  //     }
  //   );
  // }

  //  Widget passwordField() {
  //    return StreamBuilder(
  //      stream: bloc.password,
  //      builder: (context, snapshot) {
  //        return TextField(
  //         onChanged: bloc.changePassword, // references sink.add, which passes it to the transformer and the process is repeated for new vslues as user enters more character 
  //         decoration: InputDecoration(
  //           hintText: 'Password',
  //           labelText: 'Password',
  //           errorText: snapshot.error
  //         ),
  //       );
  //     }
  //    );
  // }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot){
        return RaisedButton(
          child: Text('Login'),
          color: Colors.blue,
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }
}