import 'package:prayer_bloc/bloc/prayer_bloc.dart';
import 'package:prayer_bloc/home_page.dart';
import 'package:prayer_bloc/repository/options_repository.dart';
import 'package:prayer_bloc/repository/prayer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/options_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PrayerBloc>(
          create: (BuildContext context) => PrayerBloc(repository: PrayerRepositoryImpl()),
        ),
        BlocProvider<OptionsBloc>(
          create: (BuildContext context) => OptionsBloc(OptionsRepositoryImp()),
        ),
      ],
      child: HomePage(),
    );
//    return MaterialApp(
//      title: 'BlocAPI',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: BlocProvider(
//        builder: (context) => PrayerBloc(repository: PrayerRepositoryImpl()),
//        child: HomePage(),
//      ),
//    );
  }
}

