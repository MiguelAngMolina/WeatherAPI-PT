import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MiniMapComparison extends StatefulWidget {
  final LatLng dayLocation;
  final LatLng eventLocation;

  const MiniMapComparison({
    super.key,
    required this.dayLocation,
    required this.eventLocation,
  });

  @override
  State<MiniMapComparison> createState() => _MiniMapComparisonState();
}

class _MiniMapComparisonState extends State<MiniMapComparison> {
  GoogleMapController? _controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 220,
        width: double.infinity,
        child: GoogleMap(
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          rotateGesturesEnabled: false,
          tiltGesturesEnabled: false,
          zoomGesturesEnabled: true,
          scrollGesturesEnabled: true,
          initialCameraPosition: CameraPosition(
            target: widget.dayLocation,
            zoom: 10,
          ),
          onMapCreated: (controller) async {
            _controller = controller;

            LatLngBounds bounds = LatLngBounds(
              southwest: LatLng(
                widget.dayLocation.latitude < widget.eventLocation.latitude
                    ? widget.dayLocation.latitude
                    : widget.eventLocation.latitude,
                widget.dayLocation.longitude < widget.eventLocation.longitude
                    ? widget.dayLocation.longitude
                    : widget.eventLocation.longitude,
              ),
              northeast: LatLng(
                widget.dayLocation.latitude > widget.eventLocation.latitude
                    ? widget.dayLocation.latitude
                    : widget.eventLocation.latitude,
                widget.dayLocation.longitude > widget.eventLocation.longitude
                    ? widget.dayLocation.longitude
                    : widget.eventLocation.longitude,
              ),
            );

            Future.delayed(const Duration(milliseconds: 300), () {
              controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
            });
          },

          markers: {
            Marker(
              markerId: const MarkerId("dayLocation"),
              position: widget.dayLocation,
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
              infoWindow: const InfoWindow(title: "Ubicación de la búsqueda"),
            ),
            Marker(
              markerId: const MarkerId("eventLocation"),
              position: widget.eventLocation,
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
              infoWindow: const InfoWindow(title: "Ubicación del evento"),
            ),
          },
        ),
      ),
    );
  }
}
