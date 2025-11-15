// code from QuickType.io

class ReportResponse {
    final int queryCost;
    final double latitude;
    final double longitude;
    final String resolvedAddress;
    final String address;
    final String timezone;
    final double tzoffset;
    final List<Day> days;

    ReportResponse({
        required this.queryCost,
        required this.latitude,
        required this.longitude,
        required this.resolvedAddress,
        required this.address,
        required this.timezone,
        required this.tzoffset,
        required this.days,
    });

    factory ReportResponse.fromJson(Map<String, dynamic> json) => ReportResponse(
        queryCost: json["queryCost"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        resolvedAddress: json["resolvedAddress"],
        address: json["address"],
        timezone: json["timezone"],
        tzoffset: json["tzoffset"].toDouble(),
        days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "queryCost": queryCost,
        "latitude": latitude,
        "longitude": longitude,
        "resolvedAddress": resolvedAddress,
        "address": address,
        "timezone": timezone,
        "tzoffset": tzoffset,
        "days": List<dynamic>.from(days.map((x) => x.toJson())),
    };
}

class Day {
    final DateTime datetime;
    final int datetimeEpoch;
    final double tempmax;
    final double tempmin;
    final double temp;
    final double feelslikemax;
    final double feelslikemin;
    final double feelslike;
    final double dew;
    final double humidity;
    final double precip;
    final double precipprob;
    final double precipcover;
    final List<String> preciptype;
    final double snow;
    final double snowdepth;
    final double windgust;
    final double windspeed;
    final double winddir;
    final double pressure;
    final double cloudcover;
    final double visibility;
    final double solarradiation;
    final double solarenergy;
    final double uvindex;
    final double severerisk;
    final String sunrise;
    final int sunriseEpoch;
    final String sunset;
    final int sunsetEpoch;
    final double moonphase;
    final String conditions;
    final String description;
    final String icon;
    final String source;

    Day({
        required this.datetime,
        required this.datetimeEpoch,
        required this.tempmax,
        required this.tempmin,
        required this.temp,
        required this.feelslikemax,
        required this.feelslikemin,
        required this.feelslike,
        required this.dew,
        required this.humidity,
        required this.precip,
        required this.precipprob,
        required this.precipcover,
        required this.preciptype,
        required this.snow,
        required this.snowdepth,
        required this.windgust,
        required this.windspeed,
        required this.winddir,
        required this.pressure,
        required this.cloudcover,
        required this.visibility,
        required this.solarradiation,
        required this.solarenergy,
        required this.uvindex,
        required this.severerisk,
        required this.sunrise,
        required this.sunriseEpoch,
        required this.sunset,
        required this.sunsetEpoch,
        required this.moonphase,
        required this.conditions,
        required this.description,
        required this.icon,
        required this.source,
    });

    factory Day.fromJson(Map<String, dynamic> json) => Day(
        datetime: DateTime.parse(json["datetime"]),
        datetimeEpoch: json["datetimeEpoch"],
        tempmax: json["tempmax"]?.toDouble(),
        tempmin: json["tempmin"]?.toDouble(),
        temp: json["temp"]?.toDouble(),
        feelslikemax: json["feelslikemax"]?.toDouble(),
        feelslikemin: json["feelslikemin"]?.toDouble(),
        feelslike: json["feelslike"]?.toDouble(),
        dew: json["dew"]?.toDouble(),
        humidity: json["humidity"]?.toDouble(),
        precip: json["precip"]?.toDouble(),
        precipprob: json["precipprob"]?.toDouble(),
        precipcover: json["precipcover"]?.toDouble(),
        preciptype: List<String>.from(json["preciptype"].map((x) => x)),
        snow: json["snow"],
        snowdepth: json["snowdepth"]?.toDouble(),
        windgust: json["windgust"]?.toDouble(),
        windspeed: json["windspeed"]?.toDouble(),
        winddir: json["winddir"]?.toDouble(),
        pressure: json["pressure"]?.toDouble(),
        cloudcover: json["cloudcover"]?.toDouble(),
        visibility: json["visibility"]?.toDouble(),
        solarradiation: json["solarradiation"]?.toDouble(),
        solarenergy: json["solarenergy"]?.toDouble(),
        uvindex: json["uvindex"]?.toDouble(),
        severerisk: json["severerisk"]?.toDouble(),
        sunrise: json["sunrise"],
        sunriseEpoch: json["sunriseEpoch"],
        sunset: json["sunset"],
        sunsetEpoch: json["sunsetEpoch"],
        moonphase: json["moonphase"]?.toDouble(),
        conditions: json["conditions"],
        description: json["description"],
        icon: json["icon"],
        source: json["source"],
    );

    Map<String, dynamic> toJson() => {
        "datetime": "${datetime.year.toString().padLeft(4, '0')}-${datetime.month.toString().padLeft(2, '0')}-${datetime.day.toString().padLeft(2, '0')}",
        "datetimeEpoch": datetimeEpoch,
        "tempmax": tempmax,
        "tempmin": tempmin,
        "temp": temp,
        "feelslikemax": feelslikemax,
        "feelslikemin": feelslikemin,
        "feelslike": feelslike,
        "dew": dew,
        "humidity": humidity,
        "precip": precip,
        "precipprob": precipprob,
        "precipcover": precipcover,
        "preciptype": List<dynamic>.from(preciptype.map((x) => x)),
        "snow": snow,
        "snowdepth": snowdepth,
        "windgust": windgust,
        "windspeed": windspeed,
        "winddir": winddir,
        "pressure": pressure,
        "cloudcover": cloudcover,
        "visibility": visibility,
        "solarradiation": solarradiation,
        "solarenergy": solarenergy,
        "uvindex": uvindex,
        "severerisk": severerisk,
        "sunrise": sunrise,
        "sunriseEpoch": sunriseEpoch,
        "sunset": sunset,
        "sunsetEpoch": sunsetEpoch,
        "moonphase": moonphase,
        "conditions": conditions,
        "description": description,
        "icon": icon,
        "source": source,
    };
}
