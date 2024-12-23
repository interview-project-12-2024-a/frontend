import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/app_module.dart';
import 'package:frontend/app/app_widget.dart';

void main() async {
  //TODO init firebase herer
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
