import 'package:flutter/material.dart';
import 'package:leal_flutter/ui/screens/favorite/favorite_screen.dart';
import 'package:leal_flutter/ui/screens/home/home_screen.dart';
import 'package:leal_flutter/ui/screens/login/login_screen.dart';
import 'package:leal_flutter/ui/screens/movie/movie_screen.dart';
import 'package:leal_flutter/ui/screens/movie_details/movie_details_screen.dart';
import 'package:leal_flutter/ui/screens/recent/recent_screen.dart';
import 'package:leal_flutter/ui/screens/recent_details/recent_details_screen.dart';

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

  ///The route to the movie favorites screen.
  static const favorite = '/favorite';

  ///The route to the recent screen.
  static const recent = '/recent';

  ///The route to the recent details screen.
  static const recentDetails = '/recentDetails';

  //?Routes
  static final routes = <String, WidgetBuilder>{
    initialRoute: (context) => const AuthScreen(),
    login: (context) => const LoginScreen(),
    home: (context) => const HomeScreen(),
    movie: (context) => const MovieScreen(),
    movieDetails: (context) => const MovieDetailsScreen(),
    favorite: (context) => const FavoriteScreen(),
    recent: (context) => const RecentScreen(),
    recentDetails: (context) => const RecentDetailsScreen(),
  };
}
