import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:leal_flutter/data/models/episode_model.dart';
import 'package:leal_flutter/domain/repositories/remote/episode_repository.dart';

class MovieDetailsController {
  MovieDetailsController(this._episodeRepository);

  ///Repository of episode
  final EpisodeRepository _episodeRepository;

  ///Get episodes of the movie
  Future<EpisodeModel> getEpisodes(
      {required int id, int episodeNumber = 1}) async {
    return _episodeRepository.getEpisodes(id: id, episode: episodeNumber);
  }
}

final movieDetailsControllerProvider = Provider.autoDispose(
    (ref) => MovieDetailsController(ref.read(episodeRepositoryProvider)));
