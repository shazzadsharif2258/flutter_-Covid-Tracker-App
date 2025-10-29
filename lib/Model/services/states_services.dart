import 'dart:convert';

import 'package:covid_tracker/Model/services/Utilities/app_url.dart';
import 'package:covid_tracker/Model/world_states_model.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatesModel> getData() async {
    final response = await http.get(
      Uri.parse(AppUrl.wroldStates),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
