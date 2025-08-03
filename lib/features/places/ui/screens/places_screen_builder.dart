import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:surf_places/features/places/ui/places_dependencies.dart';
import 'package:surf_places/features/places/ui/screens/places_model.dart';
import 'package:surf_places/features/places/ui/screens/places_screen.dart';
import 'package:surf_places/features/places/ui/screens/places_wm.dart';

/// Билдер для экрана списка мест.
class PlacesScreenBuilder extends StatelessWidget {
  const PlacesScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...PlacesDependencies.providers(),
        Provider<IPlacesWM>(
          create: (context) => PlacesWM(context.read<IPlacesModel>(), context.read<IFavoritesRepository>()),
        ),
      ],
      child: Builder(builder: (context) => PlacesScreen(wm: context.read<IPlacesWM>())),
    );
  }
}
