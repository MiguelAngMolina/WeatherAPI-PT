import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapi_gse/domain/entities/entities.dart';
import 'package:weatherapi_gse/presentation/widgets/widgets.dart';


class DayDetailsScreen extends StatelessWidget {
  final Day dia;
  final String location;

  const DayDetailsScreen({
    super.key,
    required this.dia,
    required this.location,
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
                LocationAndDate(location: location, date: dia.datetime),
                const SizedBox(height: 24),
                CurrentWeather(dia: dia),
                const SizedBox(height: 30),
                WeatherDescriptionCard(description: dia.description),
                const SizedBox(height: 30,),
                WeatherDetailsCard(dia: dia),
                const SizedBox(height: 30),
                SunTimesCard(dia: dia),
                const SizedBox(height: 20),
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


