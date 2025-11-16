import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapi_gse/config/flavors/flavors.dart';
import 'package:weatherapi_gse/presentation/providers/report_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final providerFuture = ref.read(reportStateProvider.future);
    final minimumDelay = Future.delayed(const Duration(seconds: 4));

    // Espera el provider + el tiempo mínimo
    await Future.wait([providerFuture, minimumDelay]);

    if (!mounted) return;
    context.go('/map');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(flex: 3),

              /// Imagen principal
              SizedBox(
                width: MediaQuery.of(context).size.width ,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Icon(
                    Icons.cloudy_snowing,
                    color:Theme.of(context).colorScheme.primary,
                    size: 190,
                  )
                ),
              ),

              const Spacer(flex: 2),

              /// Título
              Text(
                F.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
              ),

              const SizedBox(height: 12),

              /// Subtítulo
              const Text(
                "Hecho por Miguel Angel Molina",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 32),

              /// Loader
              const CircularProgressIndicator(),

              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
