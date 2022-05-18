import 'package:bloc/bloc.dart';
import 'package:blog/core/data/repository.dart';
import 'package:blog/core/network/api_client.dart';
import 'package:blog/simple_bloc_observer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app.dart';
import 'core/data/hive/hive_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var getIt = GetIt.instance;
  getIt.registerSingleton<ApiClient>(ApiClient(Dio()));
  getIt.registerSingleton<Repository>(HiveRepository());
  await getIt<Repository>().init();

  BlocOverrides.runZoned(
    () => runApp(App()),
    blocObserver: SimpleBlocObserver(),
  );
}
