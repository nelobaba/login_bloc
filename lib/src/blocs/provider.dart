import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  @override
  bool updateShouldNotify(_) => true;

  //  pass the arguments to super class constructor
  Provider({Key key, Widget child})
    : super(key: key, child: child);

  // this will take the context of the child widget and crawl up to a,
  // parent widget of type Provider and return it's bloc property
  static Bloc of( BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
    // return (context.dependOnInheritedWidgetOfExactType() as Provider).bloc;
  }
}