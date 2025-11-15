

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/flavors/app.dart';
import 'config/flavors/flavors.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  
  runApp(
    const ProviderScope(
      child: App())
     );
}
