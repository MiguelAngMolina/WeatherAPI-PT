
import 'package:flutter/material.dart';
import 'package:weatherapi_gse/config/router/app_router.dart';

import 'flavors.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: F.title,
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }

}
