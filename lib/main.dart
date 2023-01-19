import 'package:cat_trivia/injector.dart';
import 'package:cat_trivia/screens/cached_cat_facts/bloc/cached_cat_facts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/fact_screen/bloc/fact_bloc.dart';
import 'screens/fact_screen/fact_screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => getIt<FactBloc>()..add(FactEvent.fetch())),
      BlocProvider(create: (context) => getIt<CachedCatFactsBloc>()..add(CachedCatFactsEvent.fetch())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FactScreen(),
    );
  }
}
