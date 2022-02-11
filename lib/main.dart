import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_people_demo/home_new/bloc/home_page_bloc.dart';
import 'package:flutter_people_demo/rest_client.dart';

import 'home_new/home_page_new.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter People Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<HomePageBloc>(
        create: (context) => HomePageBloc(client: RestClient()),
        child: HomePageNew(),
      ),
    );
  }
}
