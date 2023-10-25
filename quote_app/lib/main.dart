import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/view/screens/quote_screen.dart';
import 'package:quote_app/view_model/bloc/observer.dart';
import 'package:quote_app/view_model/data/local/shared_prefernce.dart';
import 'package:quote_app/view_model/data/network/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Bloc.observer=MyBlocObserver();
  LocalData.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuoteScreen(),
    );
  }
}

