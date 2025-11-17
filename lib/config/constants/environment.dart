import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String wheaterApiKey = '';

  static Future<void> init() async {
    await dotenv.load();
    wheaterApiKey = dotenv.env['WEATHER_API_KEY'] ?? '';
  }
}
