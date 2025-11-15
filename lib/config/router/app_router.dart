import 'package:go_router/go_router.dart';
import 'package:weatherapi_gse/presentation/screens/home.dart';
import 'package:weatherapi_gse/presentation/screens/report_screen.dart';

final GoRouter router =  GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => Home(),
      ),

    GoRoute(
      path: '/report',
      builder: (context, state) => ReportScreen(),
      ),


  ]);