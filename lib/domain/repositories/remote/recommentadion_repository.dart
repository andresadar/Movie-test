import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/response_model.dart';
import '../../../data/services/remote/recommendation_services.dart';

///This class contains the repository to get the population data.
class RecommendationRepository {
  ///The services to get the population data.
  final RecommendationServices _recommendationServices;

  ///Constructor.
  RecommendationRepository(this._recommendationServices);

  ///Get the recommendation data.
  Future<ResponseModel> getRecommendation() async {
    ///Get the population data.
    return await _recommendationServices.getRecommendation();
  }
}

final recommendationRepositoryProvider =
    Provider.autoDispose<RecommendationRepository>((ref) {
  return RecommendationRepository(ref.read(recommendationServicesProvider));
});
