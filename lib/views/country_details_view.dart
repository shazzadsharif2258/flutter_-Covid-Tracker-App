import 'package:covid_tracker/Model/country_list.dart';
import 'package:covid_tracker/views/reuse_row.dart';
import 'package:flutter/material.dart';

class CountryDetailsView extends StatefulWidget {
  final CountriesModel country;

  const CountryDetailsView({
    super.key,
    required this.country,
  });

  @override
  State<CountryDetailsView> createState() =>
      _CountryDetailsViewState();
}

class _CountryDetailsViewState
    extends State<CountryDetailsView> {
  @override
  Widget build(BuildContext context) {
    final c = widget.country;
    return Scaffold(
      appBar: AppBar(
        title: Text(c.country!),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top:
                      MediaQuery.of(context).size.height *
                      0.067,
                ),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height:
                            MediaQuery.of(
                              context,
                            ).size.height *
                            0.06,
                      ),
                      ReuseRow(
                        value: c.cases.toString(),
                        title: 'Cases',
                      ),
                      ReuseRow(
                        value: c.recovered.toString(),
                        title: 'Recovered',
                      ),
                      ReuseRow(
                        value: c.deaths.toString(),
                        title: 'Death',
                      ),
                      ReuseRow(
                        value: c.critical.toString(),
                        title: 'Critical',
                      ),
                      ReuseRow(
                        value: c.todayRecovered.toString(),
                        title: 'Today Recovered',
                      ),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  c.countryInfo!.flag!.toString(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
