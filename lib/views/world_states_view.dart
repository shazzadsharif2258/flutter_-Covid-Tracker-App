import 'package:covid_tracker/Model/services/states_services.dart';
import 'package:covid_tracker/Model/world_states_model.dart';
import 'package:covid_tracker/views/countries_list.dart';
import 'package:covid_tracker/views/reuse_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesView extends StatefulWidget {
  const WorldStatesView({super.key});

  @override
  State<WorldStatesView> createState() =>
      _WorldStatesViewState();
}

class _WorldStatesViewState extends State<WorldStatesView>
    with TickerProviderStateMixin {
  late AnimationController c = AnimationController(
    duration: Duration(seconds: 3),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    super.dispose();
    c.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices ss = StatesServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height:
                    MediaQuery.of(context).size.height *
                    0.01,
              ),
              FutureBuilder(
                future: ss.getData(),
                builder:
                    (
                      context,
                      AsyncSnapshot<WorldStatesModel>
                      asyncSnapshot,
                    ) {
                      if (!asyncSnapshot.hasData) {
                        return Expanded(
                          flex: 1,
                          child: SpinKitFadingCircle(
                            color: Colors.white,
                            size: 50,
                            controller: c,
                          ),
                        );
                      }
                      return Column(
                        children: [
                          PieChart(
                            dataMap: {
                              'Total': double.parse(
                                asyncSnapshot.data!.cases
                                    .toString(),
                              ),
                              'Recoverd': double.parse(
                                asyncSnapshot
                                    .data!
                                    .recovered
                                    .toString(),
                              ),
                              'Deaths': double.parse(
                                asyncSnapshot.data!.deaths
                                    .toString(),
                              ),
                            },
                            chartValuesOptions:
                                const ChartValuesOptions(
                                  showChartValues: true,
                                  showChartValueBackground:
                                      false,
                                  showChartValuesInPercentage:
                                      true,
                                  showChartValuesOutside:
                                      false,
                                  decimalPlaces: 1,
                                  chartValueStyle: TextStyle(
                                    color: Colors
                                        .white, // set chart value text color
                                    fontSize: 14,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),

                            animationDuration: Duration(
                              microseconds: 1200,
                            ),
                            chartRadius:
                                MediaQuery.of(
                                  context,
                                ).size.width /
                                3.2,

                            // legendOptions: LegendOptions(
                            //   legendPosition: LegendPosition.left,
                            // ),
                            legendOptions: const LegendOptions(
                              showLegends: true,
                              legendPosition:
                                  LegendPosition.left,
                              legendTextStyle: TextStyle(
                                color: Colors
                                    .white, // set legend text color
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            chartType: ChartType.ring,
                            colorList: colorList,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(
                                    context,
                                  ).size.height *
                                  0.06,
                            ),

                            child: Card(
                              child: Column(
                                children: [
                                  ReuseRow(
                                    value: asyncSnapshot
                                        .data!
                                        .cases
                                        .toString(),
                                    title: 'Total Cases',
                                  ),
                                  ReuseRow(
                                    value: asyncSnapshot
                                        .data!
                                        .deaths
                                        .toString(),
                                    title: 'Deaths',
                                  ),
                                  ReuseRow(
                                    value: asyncSnapshot
                                        .data!
                                        .recovered
                                        .toString(),
                                    title: 'Recovered',
                                  ),
                                  ReuseRow(
                                    value: asyncSnapshot
                                        .data!
                                        .active
                                        .toString(),
                                    title: 'Active',
                                  ),
                                  ReuseRow(
                                    value: asyncSnapshot
                                        .data!
                                        .critical
                                        .toString(),
                                    title: 'Critical',
                                  ),
                                  ReuseRow(
                                    value: asyncSnapshot
                                        .data!
                                        .todayDeaths
                                        .toString(),
                                    title: 'Today Deaths',
                                  ),
                                  ReuseRow(
                                    value: asyncSnapshot
                                        .data!
                                        .todayRecovered
                                        .toString(),
                                    title:
                                        'Today Recovered',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CountriesList(),
                              ),
                            ),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xff1aa260),
                                borderRadius:
                                    BorderRadius.circular(
                                      10,
                                    ),
                              ),
                              child: Center(
                                child: Text(
                                  'Track Countries',
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
              ),

              // SizedBox(
              //   height:
              //       MediaQuery.of(context).size.height *
              //       0.03,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
