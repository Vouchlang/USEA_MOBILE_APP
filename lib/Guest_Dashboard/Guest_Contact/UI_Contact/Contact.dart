import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '/theme_builder.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import 'Custom_Build_Contact.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  late final GoogleMapController mapController;
  late BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  late final LatLng _pGooglePlex = LatLng(13.350682787083263, 103.86438269625718);
  late MapType _currentMapType = MapType.normal;

  @override
  void initState() {
    super.initState();
    addCustomIcon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'ទំនាក់ទំនង'.tr),
      body: Stack(
        children: [
          buildGoogleMap(),
          buildBtnList(
            btn1: buildBtnMap(
              mode: () => setState(
                () => _currentMapType = _currentMapType == MapType.normal ? MapType.satellite : MapType.normal,
              ),
              icons: Icons.layers_outlined,
            ),
            btn2: buildBtnMap(
              mode: () => mapController.animateCamera(
                CameraUpdate.zoomIn(),
              ),
              icons: Icons.add,
            ),
            btn3: buildBtnMap(
              mode: () => mapController.animateCamera(
                CameraUpdate.zoomOut(),
              ),
              icons: Icons.remove,
            ),
          ),
          buildScrollSheet(),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void addCustomIcon() {
    BitmapDescriptor.asset(
      const ImageConfiguration(),
      imageAsset + 'new_usea_logo.png',
      height: UHeight35,
    ).then(
      (icon) => setState(
        () => markerIcon = icon,
      ),
    );
  }

  Widget buildGoogleMap() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      mapType: _currentMapType,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      initialCameraPosition: CameraPosition(
        target: _pGooglePlex,
        zoom: 13,
      ),
      markers: {
        Marker(
          icon: markerIcon,
          markerId: const MarkerId('University of South-East Asia'),
          position: _pGooglePlex,
        ),
      },
    );
  }
}
