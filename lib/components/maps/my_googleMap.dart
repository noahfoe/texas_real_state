import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'location/location_provider.dart';

class MyGoogleMap extends StatefulWidget {
  @override
  _MyGoogleMapState createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  // TODO: Markers not showing up on map
  Set<Marker> _markers = {
    Marker(
      markerId: MarkerId("redpoint"),
      position: LatLng(29.8719, 97.9290),
    ),
    Marker(
      markerId: MarkerId("castlerock"),
      position: LatLng(29.8942, 97.9080),
    ),
    Marker(
      markerId: MarkerId("vistas"),
      position: LatLng(29.8852, 97.9433),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(builder: (consumerContext, model, child) {
      return Column(
        children: [
          Expanded(
            child: GoogleMap(
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              myLocationButtonEnabled: false,
              compassEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: model.locationPosition,
                zoom: 13,
                tilt: 60,
                bearing: 0,
              ),
              markers: _markers,
              myLocationEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controllerGoogleMap.complete(controller);
              },
            ),
          ),
        ],
      );
    });
  }
}
