import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlaceLocation {
  const PlaceLocation(
      {required this.latitide, required this.longitude, required this.address});
  final double latitide;
  final double longitude;
  final String address;
}

class Place {
  Place({
    // required this.location,
    required this.title,
    required this.image,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final File image;
  // final PlaceLocation location;
}
