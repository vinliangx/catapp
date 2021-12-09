import 'package:catapp/bloc/random_cat_bloc.dart';
import 'package:catapp/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const CatApp());
}

class CatApp extends StatelessWidget {
  const CatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat APP',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      themeMode: ThemeMode.dark,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RandomCatBloc()..add(RequestRandomCatEvent()),
          )
        ],
        child: const CatHomePage(),
      ),
    );
  }
}
