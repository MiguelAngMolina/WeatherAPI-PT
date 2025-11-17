
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weatherapi_gse/domain/entities/entities.dart';
import 'package:weatherapi_gse/presentation/widgets/widgets.dart';


class EventDetailsScreen extends StatelessWidget {
  final Event event;

  const EventDetailsScreen({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LocationAndDate (location: event.location, date: event.datetime,),
                const SizedBox(height: 24),
                EventInformation(event: event,),
                const SizedBox(height: 24),
                DescriptionCard(description: event.desc),
                const SizedBox(height: 24),
                UbicationInfo(event: event,),
                const SizedBox(height: 24),
                MiniMapComparison(
                  dayLocation: LatLng(event.reportlat, event.longitude),
                  eventLocation: LatLng(event.latitude, event.longitude),
                ),

                
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        
        onPressed: () => context.pop(),
        backgroundColor: Colors.green.shade200 ,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

class UbicationInfo extends StatelessWidget {

  final Event event;
  const UbicationInfo({
    super.key, required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Ubicación del evento - Ocurrió a ${event.distance} km",
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}


