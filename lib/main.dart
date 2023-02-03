import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodio/bloc/food/food_bloc.dart';
import 'package:foodio/pages/search_form.dart';
import 'package:foodio/repositories/search_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Search',
      home: Scaffold(
        appBar: AppBar(title: const Text('Food Search')),
        body: BlocProvider(
          create: (_) => SearchFoodBloc(searchRepository: SearchRepository()),
          child: const SearchForm(),
        ),
      ),
    );
  }
}
