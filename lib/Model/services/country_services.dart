import 'dart:convert';

import 'package:covid_tracker/Model/country_list.dart';
import 'package:covid_tracker/Model/services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class CountryServices {
  Future<List<CountriesModel>> getData() async {
    final res = await http.get(
      Uri.parse(AppUrl.countryList),
    );

    final data = jsonDecode(res.body);
    if (res.statusCode == 200) {
      return (data as List)
          .map((e) => CountriesModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Error Ftech Data');
    }
  }
}
