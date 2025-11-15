

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String wheaterApiKey = dotenv.env['THE_WEATHERAPI_KEY'] ?? 'No hay api key';
  
}
