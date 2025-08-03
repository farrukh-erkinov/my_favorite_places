import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_places/features/common/domain/repositories/i_favorites_repository.dart';
import 'package:surf_places/features/place_detail/ui/screens/place_detail_screen_builder.dart';
import 'package:surf_places/features/places/ui/widgets/place_card_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<IFavoritesRepository>().favoritesListenable.value;

    return Scaffold(
      appBar: AppBar(title: const Text('Избранное')),
      body:
          favorites.isEmpty
              ? const _EmptyFavoritesView()
              : ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final place = favorites[index];

                  return Dismissible(
                    key: ValueKey(place.name),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      padding: const EdgeInsets.only(right: 24),
                      alignment: Alignment.centerRight,
                      color: Colors.red,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (_) {
                      context.read<IFavoritesRepository>().toggleFavorite(place);
                    },
                    child: PlaceCardWidget(
                      place: place,
                      onCardTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => PlaceDetailScreenBuilder(place: place)),
                        );
                      },
                      onLikeTap: () => context.read<IFavoritesRepository>().toggleFavorite(place),
                      isFavorite: true,
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 24),
              ),
    );
  }
}

class _EmptyFavoritesView extends StatelessWidget {
  const _EmptyFavoritesView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.route, size: 72, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            'Пусто',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
