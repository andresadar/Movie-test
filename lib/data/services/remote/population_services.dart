import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:leal_flutter/app/constants/resource.dart';
import 'package:leal_flutter/data/models/response_model.dart';

///This class call the services to get the data.
class PopulationServices {
  ///Dio instance.
  final Dio _dio = Dio(BaseOptions(
      baseUrl: Resource.API_ENDPOINT, contentType: 'application/json'));

  ///Get the population data.
  Future<ResponseModel> getPopulation() async {
    ///Call the service to get the population data.
    final Response response = await _dio
        .get('/tv/popular?api_key=${Resource.API_KEY}&language=es-ES&page=1');

    ///Return the population data.
    return ResponseModel.fromJson(response.data);
  }
}

final populationServicesProvider =
    Provider.autoDispose<PopulationServices>((ref) => PopulationServices());
