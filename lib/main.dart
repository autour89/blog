import 'package:blog/core/bloc/app_state_manager.dart';
import 'package:blog/core/data/repository.dart';
import 'package:blog/core/network/api_client.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:get_it/get_it.dart';

import 'app.dart';
import 'core/data/hive/hive_repository.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterFireUIAuth.configureProviders([
    const EmailProviderConfiguration(),
    const GoogleProviderConfiguration(
        scopes: ['profile', 'email'],
        clientId:
            '510573753543-rqpl61np5itnk5014v6fgi1jhfv8u6pe.apps.googleusercontent.com'),
  ]);

  var getIt = GetIt.instance;
  getIt.registerSingleton<ApiClient>(ApiClient(Dio()));
  getIt.registerSingleton<Repository>(HiveRepository());
  getIt.registerSingleton<AppStateManager>(AppStateManager());

  await getIt<Repository>().init();

  BlocOverrides.runZoned(
    () => runApp(BlocProvider(
      create: (_) => GetIt.I.get<AppStateManager>(),
      child: const Blog(),
    )),
  );
}
