import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/routes/routes.dart';

void main() => runApp(
      const ProviderScope(child: MyApp()),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leal test App',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}
