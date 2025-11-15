import 'package:go_router/go_router.dart';
import 'package:weatherapi_gse/presentation/home.dart';

final GoRouter router =  GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => Home(),
      )
  ]);