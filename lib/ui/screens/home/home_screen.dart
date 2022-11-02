import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:leal_flutter/data/models/population_model.dart';
import 'package:leal_flutter/ui/screens/auth/auth_controller.dart';
import 'package:leal_flutter/ui/theme/colors.dart';
import 'package:leal_flutter/ui/widgets/buttons/General_button.dart';

import 'home_controller.dart';

///Widgets
part 'widgets/population.dart';
part 'widgets/recommendation.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          ///?Logout button
          IconButton(
            tooltip: 'Cerrar sesión',
            onPressed: ref.read(authControllerProvider.notifier).signOut,
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          ///?Population widget
          _PopulationWidget(),

          ///?Recommendation widget
          _RecommendationsWidget(),
        ],
      ),
    );
  }
}
