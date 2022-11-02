part of '../home_screen.dart';

///This widget is the population widget.
class _PopulationWidget extends ConsumerStatefulWidget {
  const _PopulationWidget({super.key});

  @override
  ConsumerState<_PopulationWidget> createState() => __PopulationWidgetState();
}

class __PopulationWidgetState extends ConsumerState<_PopulationWidget> {
  late ResponseModel _population;
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
      _population = await ref.read(homeControllerProvider).getPopulation();

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Popular',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 300,
          child: Builder(
            builder: (context) {
              ///If is loading
              if (isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              //if is error
              if (error) {
                return const Center(child: Text('Ups, Algo salio mal'));
              }

              return Column(
                children: [
                  ///Section population
                  SizedBox(
                    height: 250,
                    child: ListView(
                      itemExtent: 160,
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        _population.results?.length ?? 0,
                        (index) => _ItemPopulation(
                          movie: _population.results![index],
                        ),
                      ),
                    ),
                  ),

                  ///See more
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: const Text('Ver más'))),
                ],
              );
            },
          ),
        ),
        const Divider(),
      ],
    );
  }
}

///Item of the list
class _ItemPopulation extends StatelessWidget {
  const _ItemPopulation({super.key, required this.movie});

  final Results movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, AppRoutes.movie, arguments: movie),
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            ///Image
            Container(
                height: 180,
                decoration: BoxDecoration(
                  color: UIColors.backgroundColor,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500/${movie.backdropPath}"),
                      fit: BoxFit.cover),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                )),

            ///Name movie
            Text('${movie.name}', maxLines: 2, overflow: TextOverflow.ellipsis),

            ///Rating
            Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow),
                Text('${movie.voteAverage}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
