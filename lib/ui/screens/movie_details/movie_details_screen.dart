import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:leal_flutter/data/models/episode_model.dart';
import 'package:leal_flutter/ui/screens/movie_details/movie_details_controller.dart';

import '../../../data/models/response_model.dart';

class MovieDetailsScreen extends ConsumerWidget {
  const MovieDetailsScreen({super.key, required this.movie});

  final Results movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heigh = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title:
            Text('${movie.name}', maxLines: 1, overflow: TextOverflow.ellipsis),
        actions: [
          ///Add to favorites
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border))
        ],
      ),
      body: FutureBuilder<EpisodeModel>(
        future:
            ref.read(movieDetailsControllerProvider).getEpisodes(id: movie.id!),
        builder: (context, snapshot) {
          ///If the state is loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          ///If the state is error
          if (snapshot.hasError || snapshot.data == null) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final episode = snapshot.data!;

          ///If the state is loaded
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text('Episodio 1',
                  style: Theme.of(context).textTheme.titleMedium),

              const SizedBox(height: 10),

              ///Image
              Container(
                height: 200,
                width: width * .6,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500/${episode.stillPath}"),
                      fit: BoxFit.cover),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ///Name episode
              Text('${episode.name}',
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),

              const Divider(
                thickness: 2,
              ),

              ///Description
              Text(
                '${episode.overview}',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          );
        },
      ),
    );
  }
}
