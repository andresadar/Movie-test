part of '../home_screen.dart';

class _RecommendationsWidget extends ConsumerStatefulWidget {
  const _RecommendationsWidget({super.key});

  @override
  ConsumerState<_RecommendationsWidget> createState() =>
      _RecommendationsWidgetState();
}

class _RecommendationsWidgetState
    extends ConsumerState<_RecommendationsWidget> {
  late ResponseModel _recommendations;
  bool error = false;
  bool isLoading = false;

  ///Get the population data.
  void _getData() async {
    setState(() {
      error = false;
      isLoading = true;
    });

    try {
      ///Get the population data.
      _recommendations = await ref.read(homeControllerProvider).getPopulation();

      setState(() => isLoading = false);
    } catch (e) {
      log(e.toString());
      setState(() {
        error = true;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ///Title
      Text(
        'Recomendaciones',
        style: Theme.of(context).textTheme.headline6,
      ),

      const SizedBox(height: 10),

      ///If there is an error
      if (error)
        const Center(
          child: Text('Ups! Algo salió mal'),
        )

      ///If the data is loading
      else if (isLoading)
        const Center(
          child: CircularProgressIndicator(),
        )

      ///If the data is loaded
      else
        ...List.generate(
            _recommendations.results?.length ?? 0,
            (index) =>
                _ItemRecommendation(movie: _recommendations.results![index])),
    ]);
  }
}

///Item of the list
class _ItemRecommendation extends StatelessWidget {
  const _ItemRecommendation({super.key, required this.movie});

  final Results movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: Row(
          children: [
            ///Image
            Container(
              // height: 150,
              width: 120,
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: UIColors.backgroundColor,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            ///Info movie
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ///Name movie
                  Text('${movie.name}',
                      maxLines: 2, overflow: TextOverflow.ellipsis),

                  // ///Rating
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      Text('${movie.voteAverage}')
                    ],
                  ),

                  // ///Watch and favorite
                  Row(
                    children: [
                      Expanded(
                          child: GeneralButton(
                              text: 'Ver ahora', onPressed: () {})),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
