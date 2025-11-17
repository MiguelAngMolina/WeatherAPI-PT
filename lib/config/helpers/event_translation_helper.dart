class EventLabels {
  static String label(String type) {
    switch (type) {
      case 'hail':
        return 'Granizo';
      case 'earthquake':
        return 'Terremoto';
      case 'tornado':
        return 'Tornado';
      case 'wind':
        return 'Daños por viento';
      default:
        return 'Evento';
    }
  }
}
