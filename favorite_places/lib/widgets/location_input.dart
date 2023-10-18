import 'dart:convert';

import 'package:favorite_places/model/place_model.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  double latadr = 0.0;
  double longadr = 0.0;

  var _isGettingLocation = false;

  var _hasImage = false;
  String get locationImage {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latadr,$longadr&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latadr,$longadr&key=AIzaSyDicvWG9AvuWShiwGOMwhB5EQ1vg4RETPc';
  }

  void _getCurrentLocation() async {
    Location? location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      _isGettingLocation = true;
    });
    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final long = locationData.longitude;
    if (lat == null || long == null) {
      return;
    }
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=AIzaSyDicvWG9AvuWShiwGOMwhB5EQ1vg4RETPc');
    final response = await http.get(url);
    final resData = json.decode(response.body);
    final address = resData['results'][0]['formatted_address'];
    latadr = lat;
    longadr = long;
    setState(() {
      PlaceLocation(
        latitide: lat,
        longitude: long,
        address: address,
      );
      _hasImage = true;
      _isGettingLocation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Text(
      // coord,
      'No Location Choosen',
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: Theme.of(context).colorScheme.primary),
    );
    if (_hasImage) {
      mainContent = Image.network(
        locationImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }
    if (_isGettingLocation) {
      mainContent = const CircularProgressIndicator();
    }
    return Column(
      children: [
        Container(
            height: 170,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: Theme.of(context).colorScheme.onBackground),
              borderRadius: BorderRadius.circular(20),
            ),
            child: mainContent),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.location_on_outlined),
              label: const Text('Get current location'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map_outlined),
              label: const Text('Select on map'),
            ),
          ],
        )
      ],
    );
  }
}
