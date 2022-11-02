import 'package:leal_flutter/data/models/episode_model.dart';

abstract class MovieDetailsState {}

///Initial state of the movie screen
class MovieDetailsInitial extends MovieDetailsState {}

///State of the movie screen when the movie is loading
class MovieDetailsLoading extends MovieDetailsState {}

///State of the movie screen when the movie is loaded
class MovieDetailsLoaded extends MovieDetailsState {
  final EpisodeModel episode;

  MovieDetailsLoaded({required this.episode});
}

///State of the movie screen when the movie is error
class MovieDetailsError extends MovieDetailsState {
  final String message;

  MovieDetailsError(this.message);
}
