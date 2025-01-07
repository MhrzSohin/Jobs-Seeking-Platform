import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginvalidation/bloc/jobs_bloc/jobs_bloc.dart';
import 'package:loginvalidation/core/color/pallette.dart';
import 'package:loginvalidation/ui/dashboard.dart';
import 'package:loginvalidation/ui/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobsBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Pallette.primary),
          useMaterial3: true,
        ),
        home: const Dashboard(),
      ),
    );
  }
}
