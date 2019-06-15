import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Bloc{

  final choice = StreamController<MaterialColor>();
  Stream<MaterialColor> get op=> choice.stream;
  Sink<MaterialColor>  get ip=>choice.sink;

  // Bloc(){
  //   choice.stream.listen((MaterialColor color){
  //     ip.add(color);
  //   });
  // }
  void dispose(){
    choice.close();
  }

}