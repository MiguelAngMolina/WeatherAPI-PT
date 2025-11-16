import 'package:go_router/go_router.dart';
import 'package:weatherapi_gse/presentation/screens/home.dart';
import 'package:weatherapi_gse/presentation/screens/report_screen.dart';
import 'package:weatherapi_gse/presentation/screens/splash_screen.dart';

final GoRouter router =  GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
      ),

    GoRoute(
      path: '/home',
      builder: (context, state) => Home(),
      ),

    GoRoute(
      path: '/report',
      builder: (context, state) => ReportScreen(),
      ),


  ]);