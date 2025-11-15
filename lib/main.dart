

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/flavors/app.dart';
import 'config/flavors/flavors.dart';

void main() {
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  runApp(const App());
}
