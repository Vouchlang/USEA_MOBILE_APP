import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '/theme_builder.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  late GoogleMapController mapController;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  final LatLng _pGooglePlex = LatLng(13.350682787083263, 103.86438269625718);

  @override
  void initState() {
    super.initState();
    addCustomIcon();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _zoomIn() {
    mapController.animateCamera(CameraUpdate.zoomIn());
  }

  // Method to zoom out
  void _zoomOut() {
    mapController.animateCamera(CameraUpdate.zoomOut());
  }

  MapType _currentMapType = MapType.normal;

  // Method to change the map type
  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void addCustomIcon() {
    BitmapDescriptor.asset(
      const ImageConfiguration(),
      // imageAsset +
      'assets/image/new_usea_logo.png',
      height: UHeight35,
    ).then((icon) {
      setState(() {
        markerIcon = icon;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'ទំនាក់ទំនង'.tr,
      ),
      body: Stack(
        children: [
          GoogleMap(
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
                markerId: const MarkerId(
                  'University of South-East Asia',
                ),
                position: const LatLng(
                  13.350682787083263,
                  103.86438269625718,
                ),
              ),
            },
          ),
          Positioned(
            top: UPdMg20,
            right: UPdMg15,
            child: Column(
              children: [
                buildBtnMap(
                  _onMapTypeButtonPressed,
                  Icons.layers_outlined,
                ),
                buildHeight5(),
                buildBtnMap(
                  _zoomIn,
                  Icons.add,
                ),
                buildHeight5(),
                buildBtnMap(
                  _zoomOut,
                  Icons.remove,
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            snapAnimationDuration: const Duration(
              microseconds: 100,
            ),
            maxChildSize: 0.75,
            minChildSize: 0.1,
            initialChildSize: 0.5,
            snap: true,
            builder: (
              BuildContext context,
              ScrollController scrollController,
            ) {
              return Container(
                padding: const EdgeInsets.all(
                  UPdMg20,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      25,
                    ),
                    topRight: Radius.circular(
                      25,
                    ),
                  ),
                  shape: BoxShape.rectangle,
                  color: UBackgroundColor,
                ),
                child: ListView(
                  shrinkWrap: true,
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    Center(
                      child: Container(
                        width: 75,
                        margin: const EdgeInsets.only(
                          bottom: UPdMg10,
                        ),
                        height: UHeight5,
                        decoration: const BoxDecoration(
                          color: UPrimaryColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              URoundedLarge,
                            ),
                          ),
                        ),
                      ),
                    ),
                    buildHeight15(),
                    buildContact(
                      imageAsset + 'Con_Email.png',
                      'info@usea.edu.kh',
                      UTitleSize,
                      UBodyWeight,
                    ),
                    buildHeight15(),
                    buildContact(
                      imageAsset + 'Con_Tel.png',
                      '063 900 090',
                      UTitleSize,
                      UBodyWeight,
                    ),
                    buildHeight15(),
                    buildContact(
                      imageAsset + 'Con_Tel.png',
                      '017 386 678',
                      UTitleSize,
                      UBodyWeight,
                    ),
                    buildHeight15(),
                    buildContact(
                      imageAsset + 'Con_Tel.png',
                      '090 905 902',
                      UTitleSize,
                      UBodyWeight,
                    ),
                    buildHeight15(),
                    buildContact(
                      imageAsset + 'Con_Tel.png',
                      '070 408 438',
                      UTitleSize,
                      UBodyWeight,
                    ),
                    buildHeight15(),
                    buildContact(
                      imageAsset + 'Con_Loc.png',
                      'ភូមិវត្តបូព៌ សង្កាត់សាលាកំរើក ស្រុកសៀមរាប ខេត្តសៀមរាប​ ព្រះរាជាណាចក្រកម្ពុជា (ទល់មុខវិទ្យាល័យអង្គរ)។'
                          .tr,
                      UTitleSize,
                      UBodyWeight,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
