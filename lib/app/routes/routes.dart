import 'package:flutter/material.dart';
import 'package:leal_flutter/ui/screens/home/home_screen.dart';
import 'package:leal_flutter/ui/screens/login/login_screen.dart';
import 'package:leal_flutter/ui/screens/movie/movie_screen.dart';
import 'package:leal_flutter/ui/screens/movie_details/movie_details_screen.dart';

import '../../data/models/response_model.dart';
import '../../ui/screens/auth/auth_screen.dart';

///The routes of the application.
abstract class AppRoutes {
  ///The route to the initial screen.
  static const initialRoute = '/';

  ///The route to the login screen.
  static const login = '/login';

  ///The route to the home screen.
  static const home = '/home';

  ///The route to the movie screen.
  static const movie = '/movie';

  ///The route to the movie details screen.
  static const movieDetails = '/movieDetails';

  //?Routes
  static final routes = <String, WidgetBuilder>{
    initialRoute: (context) => const AuthScreen(),
    login: (context) => const LoginScreen(),
    home: (context) => const HomeScreen(),
    movie: (context) {
      //?Get the movie from the arguments
      final movie = ModalRoute.of(context)!.settings.arguments as Results;

      return MovieScreen(movie: movie);
    },
    movieDetails: (context) {
      //?Get the movie from the arguments
      final movie = ModalRoute.of(context)!.settings.arguments as Results;

      return MovieDetailsScreen(movie: movie);
    },
  };
}
