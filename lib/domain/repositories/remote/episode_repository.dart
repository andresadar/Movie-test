import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:leal_flutter/data/models/episode_model.dart';
import 'package:leal_flutter/data/services/remote/episode_services.dart';

class EpisodeRepository {
  final EpisodeServices _episodeServices;

  EpisodeRepository(this._episodeServices);

  ///Get episodes of the movie
  Future<EpisodeModel> getEpisodes({required int id, required int episode}) {
    return _episodeServices.getEpisode(id: id, episode: episode);
  }
}

final episodeRepositoryProvider = Provider.autoDispose<EpisodeRepository>(
    (ref) => EpisodeRepository(ref.read(episodeServicesProvider)));
