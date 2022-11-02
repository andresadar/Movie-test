import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:leal_flutter/data/models/episode_model.dart';

import '../../../app/constants/resource.dart';

///this is the service that will be used to fetch the episodes from the API
class EpisodeServices {
  ///Dio instance.
  final Dio _dio = Dio(BaseOptions(
      baseUrl: Resource.API_ENDPOINT, contentType: 'application/json'));

  ///Get episodes of the movie
  Future<EpisodeModel> getEpisode(
      {required int id, required int episode}) async {
    ///Call the service to get the episode data.
    final response = await _dio.get(
        '/tv/$id/season/${1}/episode/$episode?api_key=${Resource.API_KEY}&language=es-ES&page=1');

    ///Return the episode data.
    return EpisodeModel.fromJson(response.data);
  }
}

final episodeServicesProvider =
    Provider.autoDispose<EpisodeServices>((ref) => EpisodeServices());
