
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weatherapi_gse/config/router/app_router.dart';
import 'package:weatherapi_gse/config/theme/app_theme.dart';

import 'flavors.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    return MaterialApp.router(
      title: F.title,
     theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      
    );
  }

}
