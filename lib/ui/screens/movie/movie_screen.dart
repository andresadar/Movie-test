import 'package:flutter/material.dart';
import 'package:leal_flutter/app/routes/routes.dart';
import 'package:leal_flutter/ui/widgets/buttons/general_button.dart';

import '../../../data/models/response_model.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key, required this.movie});

  final Results movie;

  @override
  Widget build(BuildContext context) {
    final heigh = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${movie.name}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///Image
            Container(
              height: heigh * 0.4,
              width: width * .5,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500/${movie.backdropPath}"),
                    fit: BoxFit.cover),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),

            const SizedBox(height: 20),

            ///Name movie
            Text('${movie.name}', maxLines: 2, overflow: TextOverflow.ellipsis),

            const SizedBox(height: 20),

            ///Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.yellow),
                Text('${movie.voteAverage}'),
              ],
            ),

            const SizedBox(height: 20),

            GeneralButton(
              text: 'Ver ahora',
              onPressed: () => Navigator.pushReplacementNamed(
                  context, AppRoutes.movieDetails,
                  arguments: movie),
            ),
          ],
        ),
      ),
    );
  }
}
