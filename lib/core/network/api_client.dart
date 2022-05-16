import 'package:blog/core/network/apis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/http.dart';

import '../models/fact.dart';

part "api_client.g.dart";

@RestApi(
  baseUrl: Apis.baseUrl,
  parser: Parser.FlutterCompute,
)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.catFact)
  Future<Fact> getFact();
}

Fact deserializeFact(Map<String, dynamic> json) => Fact.fromJson(json);
