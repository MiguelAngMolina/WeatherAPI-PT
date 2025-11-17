import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weatherapi_gse/config/helpers/google_geocoding.dart';
import 'package:weatherapi_gse/presentation/providers/location/user_location_provider.dart';
import 'package:weatherapi_gse/presentation/widgets/map/show_report_or_event_buttons.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});
  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  GoogleMapController? mapController;
  final searchController = TextEditingController();
  final geocodingService = GeocodingService();

  bool showWeatherButton = false;

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

void _searchAddress() async {
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

  mapController?.animateCamera(
    CameraUpdate.newLatLng(
      LatLng(result.latitude, result.longitude),
    ),
  );
  setState(() {
    showWeatherButton = false;
  });
  Future.delayed(const Duration(seconds: 1), () {
    setState(() {
      showWeatherButton = true;
    });
  });
}
  @override
  Widget build(BuildContext context) {
    final currentLocation = ref.watch(userLocationProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Ingresa una ubicación y dale buscar",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true, 
        ),
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
                    zoomControlsEnabled: false,
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
                  onSubmitted: (_) => _searchAddress(),
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Buscar dirección...",
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () async {
                        _searchAddress();
                      }
                      
                    ),
                  ),
                ),
              ),
            ),
            if (showWeatherButton)
              Positioned(
                bottom: 30,
                right: 20,
                child: FloatingActionButton.extended(
                  onPressed: () => _openOptionsPopup(context, ref),
                  backgroundColor: Colors.green.shade600,
                  label: const Text("Ver reporte / Eventos"),
                  icon: const Icon(Icons.visibility),
                ),
              ),
              if(currentLocation != null)
              Positioned(
                bottom: 30,
                left: 20,
                child:  FloatingActionButton(
                  onPressed: () {
                    context.pop();
                    ref.invalidate(userLocationProvider);

                  },
                  backgroundColor: Colors.green.shade200 ,
                  child: const Icon(Icons.arrow_back),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _openOptionsPopup(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Selecciona una opción",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              WeatherEventsButton(
                locationName: searchController.text.trim(),
                ref: ref
              ),
              SizedBox(height: 15,),
              WeatherReportButton(
                ref: ref,
                locationName: searchController.text.trim(),
              ),
            ],
          ),
        );
      },
    );
  }
}
