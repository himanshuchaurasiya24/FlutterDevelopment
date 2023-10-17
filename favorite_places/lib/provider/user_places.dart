// void addPlace(Place place) {
//   final newPlace = place;
//   state = [place, ...place];// error
// }
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/model/place_model.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);
  void addPlace(String title, File image) {
    final newPlace = Place(image: image, title: title);
    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
  (ref) => UserPlacesNotifier(),
);
