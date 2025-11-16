import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weatherapi_gse/config/helpers/google_geocoding.dart';
import 'package:weatherapi_gse/presentation/providers/location/user_location_provider.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});
  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  GoogleMapController? mapController;
  final searchController = TextEditingController();
  final geocodingService = GeocodingService();

@override
  void initState() {
    super.initState();
    _loadCurrentLocation();
  }

void _loadCurrentLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) return;

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) return;
  }

  if (permission == LocationPermission.deniedForever) return;

  final pos = await Geolocator.getCurrentPosition();
  ref.read(userLocationProvider.notifier).setLocation(pos.latitude, pos.longitude);
}


  @override
  Widget build(BuildContext context) {
    final currentLocation = ref.watch(userLocationProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Mapa")),
      body: Stack(
        children: [
          currentLocation == null
              ? const Center(child: CircularProgressIndicator())
              : GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: currentLocation,
                    zoom: 14,
                  ),
                  onMapCreated: (controller) => mapController = controller,
                  markers: {
                    Marker(
                      markerId: const MarkerId("current"),
                      position: currentLocation,
                      infoWindow: const InfoWindow(title: "Ubicación seleccionada"),
                      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
                    ),
                  },
                ),
          Positioned(
            top: 15,
            left: 20,
            right: 20,
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Buscar dirección...",
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      final address = searchController.text.trim();
                      if (address.isEmpty) return;

                      final result = await geocodingService.searchAddress(address);
                      if (result == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Dirección no encontrada")),
                        );
                        return;
                      }

                      ref.read(userLocationProvider.notifier)
                          .setLocation(result.latitude, result.longitude);

                      // Mueve la cámara al nuevo punto
                      mapController?.animateCamera(
                        CameraUpdate.newLatLng(
                            LatLng(result.latitude, result.longitude)),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
