import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:leal_flutter/data/models/population_model.dart';
import 'package:leal_flutter/domain/repositories/remote/population_repository.dart';

class HomeController {
  ///Repository of the home screen.
  final PopulationRepository _populationRepository;

  HomeController(this._populationRepository);

  ///Get the population data.
  Future<PopulationModel> getPopulation() async {
    ///Get the population data.
    return _populationRepository.getPopulation();
  }
}

final homeControllerProvider = Provider.autoDispose((ref) {
  return HomeController(ref.read(populationRepositoryProvider));
});
