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
              markers: _createMarkers(),
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

  Set<Marker> _createMarkers() {
    return {
      Marker(
        markerId: MarkerId("Redpoint"),
        position: LatLng(29.872138656794498, -97.92894137317742),
        infoWindow:
            InfoWindow(title: "Redpoint San Marcos", snippet: "650 River Rd"),
      ),
      Marker(
        markerId: MarkerId("Castlerock"),
        position: LatLng(29.894365600489596, -97.90804220201274),
        infoWindow: InfoWindow(
            title: "CastleRock San Marcos", snippet: "1610 N. Interstate 35"),
      ),
      Marker(
        markerId: MarkerId("Vistas"),
        position: LatLng(29.885342212281213, -97.94329787317722),
        infoWindow: InfoWindow(
            title: "Vistas of San Marcos", snippet: "401 Fredericksburg St."),
      ),
      Marker(
        markerId: MarkerId("Cottages"),
        position: LatLng(29.88359055441444, -97.96926920201298),
        infoWindow: InfoWindow(
            title: "Cottages of San Marcos", snippet: "1415 Craddock Ave."),
      ),
      Marker(
        markerId: MarkerId("Local"),
        position: LatLng(29.884185236645642, -97.93871230201292),
        infoWindow: InfoWindow(
            title: "The Local Downtown", snippet: "251 N. Edward Gary St."),
      ),
    };
  }
}
