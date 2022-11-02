part of '../home_screen.dart';

class _RecommendationsWidget extends StatelessWidget {
  const _RecommendationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ///Title
      Text(
        'Recomendaciones',
        style: Theme.of(context).textTheme.headline6,
      ),

      const SizedBox(height: 10),

      ...List.generate(Colors.primaries.length,
          (index) => _ItemRecommendation(color: Colors.primaries[index])),
    ]);
  }
}

///Item of the list
class _ItemRecommendation extends StatelessWidget {
  const _ItemRecommendation({super.key, required this.color});

  final Color color;

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
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            ///Info movie
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ///Name movie
                  Text(color.toString(),
                      maxLines: 2, overflow: TextOverflow.ellipsis),

                  // ///Rating
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.yellow),
                      Text('4.5')
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
