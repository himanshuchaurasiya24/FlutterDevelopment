import 'package:favorite_places/screens/places_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/place_model.dart';

class PlacesList extends ConsumerStatefulWidget {
  const PlacesList({super.key, required this.places});
  final List<Place> places;

  @override
  ConsumerState<PlacesList> createState() => _PlacesListState();
}

class _PlacesListState extends ConsumerState<PlacesList> {
  // void _deletePlace(Place place) {
  //   ref.read(userPlacesProvider.notifier).deletePlace(place);
  // }

  @override
  Widget build(BuildContext context) {
    if (widget.places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }
    return ListView.builder(
      itemCount: widget.places.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return PlaceDetailsScreen(place: widget.places[index]);
                },
              ),
            );
          },
          leading: CircleAvatar(
            radius: 26,
            // here in the background image use fileImage not image.file because the later is a widget where as the former is an imageProvider;
            backgroundImage: FileImage(widget.places[index].image),
          ),
          title: Text(
            widget.places[index].title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          subtitle: Text(widget.places[index].location.address),
          // trailing: IconButton(
          //     onPressed: () {
          //       _deletePlace(widget.places[index]);
          //     },
          //     icon: const Icon(Icons.delete_outlined)),
        );
      },
    );
  }
}
