import 'dart:async';

import 'package:city_ride/common/constants.dart';
 
import 'package:city_ride/common/utils/widgets/floatingSearchbar.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../common/utils/widgets/myDrawer.dart';

class MapPageWidget extends StatefulWidget {
  const MapPageWidget({super.key});

  @override
  State<MapPageWidget> createState() => _MapPageWidgetState();
}

class _MapPageWidgetState extends State<MapPageWidget> {
  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 18,
  );

  final Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};

  @override
  void initState() {
    super.initState();
    navigateToCurrentLoction();
  }

  void navigateToCurrentLoction() async {
    final locationPermission = await Permission.location.request();
    if (locationPermission.isGranted) {
      final controller = await mapController.future;
      final currentPosition = await Geolocator.getCurrentPosition();

      final positionStream = Geolocator.getPositionStream().listen((event) {
        final latlng =
            LatLng(currentPosition.latitude, currentPosition.longitude);

        setState(() {
          const markersId = MarkerId("My current location");

          _markers[markersId] = Marker(
              markerId: markersId,
              position: latlng,
              icon: BitmapDescriptor.defaultMarker,
              infoWindow:const InfoWindow(
                title: "infowindow",
              ));
        });

        controller.animateCamera(CameraUpdate.newLatLng(latlng));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: AppColors.appBackgroundColor,
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            mapType: MapType.hybrid,
            initialCameraPosition: kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              mapController.complete(controller);
            },
            markers: _markers.values.toSet(),
          ),
          const FloatingSearchbar()
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateToCurrentLoction();
          },
          child: const Icon(
            Icons.location_on,
          )),
    );
  }
}
