class CountriesModel {
  int? updated;
  String? country;
  CountryInfo? countryInfo;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  int? deathsPerOneMillion;
  int? tests;
  int? testsPerOneMillion;
  int? population;
  String? continent;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  double? criticalPerOneMillion; // <- changed to double

  CountriesModel({
    this.updated,
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.continent,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
  });

  factory CountriesModel.fromJson(
    Map<String, dynamic> json,
  ) {
    num? _n(dynamic v) => v is num ? v : null;

    return CountriesModel(
      updated: _n(json['updated'])?.toInt(),
      country: json['country'] as String?,
      countryInfo: json['countryInfo'] != null
          ? CountryInfo.fromJson(json['countryInfo'])
          : null,
      cases: _n(json['cases'])?.toInt(),
      todayCases: _n(json['todayCases'])?.toInt(),
      deaths: _n(json['deaths'])?.toInt(),
      todayDeaths: _n(json['todayDeaths'])?.toInt(),
      recovered: _n(json['recovered'])?.toInt(),
      todayRecovered: _n(json['todayRecovered'])?.toInt(),
      active: _n(json['active'])?.toInt(),
      critical: _n(json['critical'])?.toInt(),
      casesPerOneMillion: _n(
        json['casesPerOneMillion'],
      )?.toInt(),
      deathsPerOneMillion: _n(
        json['deathsPerOneMillion'],
      )?.toInt(),
      tests: _n(json['tests'])?.toInt(),
      testsPerOneMillion: _n(
        json['testsPerOneMillion'],
      )?.toInt(),
      population: _n(json['population'])?.toInt(),
      continent: json['continent'] as String?,
      oneCasePerPeople: _n(
        json['oneCasePerPeople'],
      )?.toInt(),
      oneDeathPerPeople: _n(
        json['oneDeathPerPeople'],
      )?.toInt(),
      oneTestPerPeople: _n(
        json['oneTestPerPeople'],
      )?.toInt(),
      activePerOneMillion: _n(
        json['activePerOneMillion'],
      )?.toDouble(),
      recoveredPerOneMillion: _n(
        json['recoveredPerOneMillion'],
      )?.toDouble(),
      criticalPerOneMillion: _n(
        json['criticalPerOneMillion'],
      )?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'updated': updated,
    'country': country,
    'countryInfo': countryInfo?.toJson(),
    'cases': cases,
    'todayCases': todayCases,
    'deaths': deaths,
    'todayDeaths': todayDeaths,
    'recovered': recovered,
    'todayRecovered': todayRecovered,
    'active': active,
    'critical': critical,
    'casesPerOneMillion': casesPerOneMillion,
    'deathsPerOneMillion': deathsPerOneMillion,
    'tests': tests,
    'testsPerOneMillion': testsPerOneMillion,
    'population': population,
    'continent': continent,
    'oneCasePerPeople': oneCasePerPeople,
    'oneDeathPerPeople': oneDeathPerPeople,
    'oneTestPerPeople': oneTestPerPeople,
    'activePerOneMillion': activePerOneMillion,
    'recoveredPerOneMillion': recoveredPerOneMillion,
    'criticalPerOneMillion': criticalPerOneMillion,
  };
}

class CountryInfo {
  int? iId;
  String? iso2;
  String? iso3;
  double? lat; // <- was int
  double? long; // <- was int
  String? flag;

  CountryInfo({
    this.iId,
    this.iso2,
    this.iso3,
    this.lat,
    this.long,
    this.flag,
  });

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    num? _n(dynamic v) => v is num ? v : null;

    return CountryInfo(
      iId: _n(json['_id'])?.toInt(),
      iso2: json['iso2'] as String?,
      iso3: json['iso3'] as String?,
      lat: _n(json['lat'])?.toDouble(),
      long: _n(json['long'])?.toDouble(),
      flag: json['flag'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': iId,
    'iso2': iso2,
    'iso3': iso3,
    'lat': lat,
    'long': long,
    'flag': flag,
  };
}
