class PrayerTimesResponse {
  int? code;
  String? status;
  List? data;
  String? error;

  PrayerTimesResponse({
    required this.code,
    required this.status,
    required this.data,
  });

  PrayerTimesResponse.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    status = json["status"];
    data = json["data"] as List;
  }

  PrayerTimesResponse.withError(this.error);
}

class PrayersData {
  Timings? timings;
  Date? date;
  Meta? meta;
  String? error;

  PrayersData({this.timings, this.date, this.meta});

  PrayersData.withError(this.error);

  PrayersData.fromJson(Map<String, dynamic> json) {
    timings =
        json['timings'] != null ? Timings.fromJson(json['timings']) : null;
    date = json['date'] != null ? Date.fromJson(json['date']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (timings != null) {
      data['timings'] = timings!.toJson();
    }
    if (date != null) {
      data['date'] = date!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Prayers {
  final String prayerName;
  final String prayerTime;
  final dynamic iconData;
  const Prayers({
    required this.prayerName,
    required this.prayerTime,
    required this.iconData,
  });
}

class Timings {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;

  Timings(
      {this.fajr,
      this.sunrise,
      this.dhuhr,
      this.asr,
      this.sunset,
      this.maghrib,
      this.isha,
      this.imsak,
      this.midnight});

  Timings.fromJson(Map<String, dynamic> json) {
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    sunset = json['Sunset'];
    maghrib = json['Maghrib'];
    isha = json['Isha'];
    imsak = json['Imsak'];
    midnight = json['Midnight'];
  }

  // factory Timings.fromTModel(){
  //   return Timings(
  //     fajr: fajr,
  //   ) ;
  // }

  Timings.fromModel(Timings? model) {
    fajr = model!.fajr;
    sunrise = model.sunrise;
    dhuhr = model.dhuhr;
    asr = model.asr;
    sunset = model.sunset;
    maghrib = model.maghrib;
    isha = model.isha;
    imsak = model.imsak;
    midnight = model.midnight;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Fajr'] = fajr;
    data['Sunrise'] = sunrise;
    data['Dhuhr'] = dhuhr;
    data['Asr'] = asr;
    data['Sunset'] = sunset;
    data['Maghrib'] = maghrib;
    data['Isha'] = isha;
    data['Imsak'] = imsak;
    data['Midnight'] = midnight;
    return data;
  }
}

class Date {
  String? readable;
  String? timestamp;
  Gregorian? gregorian;
  Hijri? hijri;

  Date({this.readable, this.timestamp, this.gregorian, this.hijri});

  Date.fromJson(Map<String, dynamic> json) {
    readable = json['readable'];
    timestamp = json['timestamp'];
    gregorian = json['gregorian'] != null
        ? Gregorian.fromJson(json['gregorian'])
        : null;
    hijri = json['hijri'] != null ? Hijri.fromJson(json['hijri']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['readable'] = readable;
    data['timestamp'] = timestamp;
    if (gregorian != null) {
      data['gregorian'] = gregorian!.toJson();
    }
    if (hijri != null) {
      data['hijri'] = hijri!.toJson();
    }
    return data;
  }
}

class Gregorian {
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;

  Gregorian(
      {this.date,
      this.format,
      this.day,
      this.weekday,
      this.month,
      this.year,
      this.designation});

  Gregorian.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday =
        json['weekday'] != null ? Weekday.fromJson(json['weekday']) : null;
    month = json['month'] != null ? Month.fromJson(json['month']) : null;
    year = json['year'];
    designation = json['designation'] != null
        ? Designation.fromJson(json['designation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['format'] = format;
    data['day'] = day;
    if (weekday != null) {
      data['weekday'] = weekday!.toJson();
    }
    if (month != null) {
      data['month'] = month!.toJson();
    }
    data['year'] = year;
    if (designation != null) {
      data['designation'] = designation!.toJson();
    }
    return data;
  }
}

class Weekday {
  String? en;

  Weekday({this.en});

  Weekday.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    return data;
  }
}

class Month {
  int? number;
  String? en;

  Month({this.number, this.en});

  Month.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['en'] = en;
    return data;
  }
}

class Designation {
  String? abbreviated;
  String? expanded;

  Designation({this.abbreviated, this.expanded});

  Designation.fromJson(Map<String, dynamic> json) {
    abbreviated = json['abbreviated'];
    expanded = json['expanded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['abbreviated'] = abbreviated;
    data['expanded'] = expanded;
    return data;
  }
}

class Hijri {
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;
  List<String>? holidays;

  Hijri(
      {this.date,
      this.format,
      this.day,
      this.weekday,
      this.month,
      this.year,
      this.designation,
      this.holidays});

  Hijri.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday =
        json['weekday'] != null ? Weekday.fromJson(json['weekday']) : null;
    month = json['month'] != null ? Month.fromJson(json['month']) : null;
    year = json['year'];
    designation = json['designation'] != null
        ? Designation.fromJson(json['designation'])
        : null;
    holidays = json['holidays'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['format'] = format;
    data['day'] = day;
    if (weekday != null) {
      data['weekday'] = weekday!.toJson();
    }
    if (month != null) {
      data['month'] = month!.toJson();
    }
    data['year'] = year;
    if (designation != null) {
      data['designation'] = designation!.toJson();
    }
    data['holidays'] = holidays;
    return data;
  }
}

class Meta {
  double? latitude;
  double? longitude;
  String? timezone;
  Method? method;
  String? latitudeAdjustmentMethod;
  String? midnightMode;
  String? school;
  Offset? offset;

  Meta(
      {this.latitude,
      this.longitude,
      this.timezone,
      this.method,
      this.latitudeAdjustmentMethod,
      this.midnightMode,
      this.school,
      this.offset});

  Meta.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    timezone = json['timezone'];
    method = json['method'] != null ? Method.fromJson(json['method']) : null;
    latitudeAdjustmentMethod = json['latitudeAdjustmentMethod'];
    midnightMode = json['midnightMode'];
    school = json['school'];
    offset = json['offset'] != null ? Offset.fromJson(json['offset']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['timezone'] = timezone;
    if (method != null) {
      data['method'] = method!.toJson();
    }
    data['latitudeAdjustmentMethod'] = latitudeAdjustmentMethod;
    data['midnightMode'] = midnightMode;
    data['school'] = school;
    if (offset != null) {
      data['offset'] = offset!.toJson();
    }
    return data;
  }
}

class Method {
  int? id;
  String? name;
  Params? params;

  Method({this.id, this.name, this.params});

  Method.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    params = json['params'] != null ? Params.fromJson(json['params']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (params != null) {
      data['params'] = params!.toJson();
    }
    return data;
  }
}

class Params {
  int? fajr;
  int? isha;

  Params({this.fajr, this.isha});

  Params.fromJson(Map<String, dynamic> json) {
    fajr = json['Fajr'];
    isha = json['Isha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Fajr'] = fajr;
    data['Isha'] = isha;
    return data;
  }
}

class Offset {
  int? imsak;
  int? fajr;
  int? sunrise;
  int? dhuhr;
  int? asr;
  int? maghrib;
  int? sunset;
  int? isha;
  int? midnight;

  Offset(
      {this.imsak,
      this.fajr,
      this.sunrise,
      this.dhuhr,
      this.asr,
      this.maghrib,
      this.sunset,
      this.isha,
      this.midnight});

  Offset.fromJson(Map<String, dynamic> json) {
    imsak = json['Imsak'];
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    maghrib = json['Maghrib'];
    sunset = json['Sunset'];
    isha = json['Isha'];
    midnight = json['Midnight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Imsak'] = imsak;
    data['Fajr'] = fajr;
    data['Sunrise'] = sunrise;
    data['Dhuhr'] = dhuhr;
    data['Asr'] = asr;
    data['Maghrib'] = maghrib;
    data['Sunset'] = sunset;
    data['Isha'] = isha;
    data['Midnight'] = midnight;
    return data;
  }
}
