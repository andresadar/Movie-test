import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/response_model.dart';
import '../../../data/services/remote/population_services.dart';

///This class contains the repository to get the population data.
class PopulationRepository {
  ///The services to get the population data.
  final PopulationServices _populationServices;

  ///Constructor.
  PopulationRepository(this._populationServices);

  ///Get the population data.
  Future<ResponseModel> getPopulation() async {
    ///Get the population data.
    return await _populationServices.getPopulation();
  }
}

final populationRepositoryProvider =
    Provider.autoDispose<PopulationRepository>((ref) {
  return PopulationRepository(ref.read(populationServicesProvider));
});
