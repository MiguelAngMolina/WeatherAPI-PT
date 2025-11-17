// code from QuickType.io
class ReportResponse {
    final int queryCost;
    final double latitude;
    final double longitude;
    final String resolvedAddress;
    final String address;
    final String timezone;
    final double tzoffset;
    final List<DayResponse> days;

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
        queryCost: json["queryCost"] ?? 0,
        latitude: (json["latitude"] as num?)?.toDouble() ?? 0.0,
        longitude: (json["longitude"] as num?)?.toDouble() ?? 0.0,
        resolvedAddress: json["resolvedAddress"] ?? '',
        address: json["address"]  ?? '',
        timezone: json["timezone"] ?? '',
        tzoffset: (json["tzoffset"] as num?)?.toDouble() ?? 0.0,
        days: List<DayResponse>.from(json["days"].map((x) => DayResponse.fromJson(x))),
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

class DayResponse {
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
    final List<EventResponse>? events;


    DayResponse({
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
        this.events
    });

    factory DayResponse.fromJson(Map<String, dynamic> json) => DayResponse(
        datetime: DateTime.parse(json["datetime"]),
        datetimeEpoch: json["datetimeEpoch"] ?? 0,
        tempmax: json["tempmax"]?.toDouble()?? 0.0,
        tempmin: json["tempmin"]?.toDouble()?? 0.0,
        temp: json["temp"]?.toDouble()?? 0.0,
        feelslikemax: json["feelslikemax"]?.toDouble()?? 0.0,
        feelslikemin: json["feelslikemin"]?.toDouble()?? 0.0,
        feelslike: json["feelslike"]?.toDouble()?? 0.0,
        dew: json["dew"]?.toDouble()?? 0.0,
        humidity: json["humidity"]?.toDouble()?? 0.0,
        precip: json["precip"]?.toDouble()?? 0.0,
        precipprob: json["precipprob"]?.toDouble()?? 0.0,
        precipcover: json["precipcover"]?.toDouble()?? 0.0,
        preciptype: json["preciptype"] == null ? [] : List<String>.from(json["preciptype"].map((x) => x)),
        snow: json["snow"] ?? 0.0,
        snowdepth: json["snowdepth"]?.toDouble() ?? 0.0,
        windgust: json["windgust"]?.toDouble() ?? 0.0 ?? 0.0,
        windspeed: json["windspeed"]?.toDouble() ?? 0.0,
        winddir: json["winddir"]?.toDouble() ?? 0.0,
        pressure: json["pressure"]?.toDouble() ?? 0.0,
        cloudcover: json["cloudcover"]?.toDouble() ?? 0.0,
        visibility: json["visibility"]?.toDouble() ?? 0.0,
        solarradiation: json["solarradiation"]?.toDouble() ?? 0.0,
        solarenergy: json["solarenergy"]?.toDouble() ?? 0.0,
        uvindex: json["uvindex"] != null 
        ? double.parse(json["uvindex"].toString())
        : 0.0, 
        severerisk: json["severerisk"]?.toDouble() ?? 0.0,
        sunrise: json["sunrise"] ?? '',
        sunriseEpoch: json["sunriseEpoch"] ?? 0, 
        sunset: json["sunset"] ?? '',
        sunsetEpoch: json["sunsetEpoch"] ?? 0,
        moonphase: json["moonphase"]?.toDouble() ?? 0.0,
        conditions: json["conditions"] ?? '',
        description: json["description"] ?? '',
        icon: json["icon"] ?? '',
        source: json["source"] ?? '',
        events: json["events"] == null ? [] : List<EventResponse>.from(json["events"]!.map((x) => EventResponse.fromJson(x))),

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
        "events": events == null ? [] : List<dynamic>.from(events!.map((x) => x.toJson())),
    };
}

class EventResponse {
    final DateTime datetime;
    final int datetimeEpoch;
    final String type;
    final double latitude;
    final double longitude;
    final double distance;
    final String desc;
    final double size;

    EventResponse({
        required this.datetime,
        required this.datetimeEpoch,
        required this.type,
        required this.latitude,
        required this.longitude,
        required this.distance,
        required this.desc,
        required this.size,
    });

    factory EventResponse.fromJson(Map<String, dynamic> json) => EventResponse(
        datetime: DateTime.parse(json["datetime"]),
        datetimeEpoch: json["datetimeEpoch"] ?? 0,
        type: json["type"] ?? '',
        latitude: json["latitude"]?.toDouble() ?? 0.0,
        longitude: json["longitude"]?.toDouble() ?? 0.0,
        distance: json["distance"]?.toDouble() ?? 0.0,
        desc: json["desc"] ?? '',
        size: json["size"]?.toDouble() ?? 0.0,
    );

    Map<String, dynamic> toJson() => {
        "datetime": datetime.toIso8601String(),
        "datetimeEpoch": datetimeEpoch,
        "type":type,
        "latitude": latitude,
        "longitude": longitude,
        "distance": distance,
        "desc": desc,
        "size": size,
    };
}
