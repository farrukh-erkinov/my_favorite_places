import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_places/features/common/domain/enitities/place_entity.dart';
import 'package:surf_places/features/place_detail/place_detail_dependencies.dart';
import 'package:surf_places/features/place_detail/ui/screens/place_detail_model.dart';
import 'package:surf_places/features/place_detail/ui/screens/place_detail_screen.dart';
import 'package:surf_places/features/place_detail/ui/screens/place_detail_wm.dart';

/// Билдер для экрана детальной информации о месте.
class PlaceDetailScreenBuilder extends StatelessWidget {
  /// Место.
  final PlaceEntity place;

  const PlaceDetailScreenBuilder({required this.place, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...PlaceDetailDependencies.providers(place),
        Provider<IPlaceDetailWM>(create: (context) => PlaceDetailWM(context.read<IPlaceDetailModel>())),
      ],
      child: Builder(builder: (context) => PlaceDetailScreen(wm: context.read<IPlaceDetailWM>(), place: place)),
    );
  }
}
