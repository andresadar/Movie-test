import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:leal_flutter/data/models/response_model.dart';
import 'package:leal_flutter/domain/repositories/remote/population_repository.dart';

import '../../../domain/repositories/remote/recommentadion_repository.dart';

class HomeController {
  ///Repository of the population
  final PopulationRepository _populationRepository;

  ///Repository of the recommendation
  final RecommendationRepository _recommendationRepository;

  HomeController(this._populationRepository, this._recommendationRepository);

  ///Get the population data.
  Future<ResponseModel> getPopulation() async {
    ///Get the population data.
    return _populationRepository.getPopulation();
  }

  ///Get the recommendation data.
  Future<ResponseModel> getRecommendation() async {
    ///Get the recommendation data.
    return _recommendationRepository.getRecommendation();
  }
}

final homeControllerProvider = Provider.autoDispose((ref) {
  return HomeController(ref.read(populationRepositoryProvider),
      ref.read(recommendationRepositoryProvider));
});
