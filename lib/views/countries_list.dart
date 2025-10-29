import 'package:covid_tracker/Model/country_list.dart';
import 'package:covid_tracker/Model/services/country_services.dart';
import 'package:covid_tracker/views/country_details_view.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() =>
      _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  final search = TextEditingController();

  CountryServices ss = CountryServices();
  @override
  void dispose() {
    super.dispose();

    search.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(
          context,
        ).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height:
                    MediaQuery.of(context).size.height *
                    0.02,
              ),
              TextFormField(
                controller: search,
                onChanged: (e) => setState(() {}),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  hintText: 'Serach with Country Name',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: ss.getData(),
                  builder:
                      (
                        context,
                        AsyncSnapshot<List<CountriesModel>>
                        snapshot,
                      ) {
                        if (!snapshot.hasData) {
                          return ListView.builder(
                            itemCount: 10,

                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor:
                                    Colors.grey.shade700,
                                highlightColor:
                                    Colors.grey.shade100,
                                child: ListTile(
                                  // leading: CircleAvatar(
                                  //   backgroundImage:
                                  //       NetworkImage(
                                  //         country
                                  //             .countryInfo!
                                  //             .flag!
                                  //             .toString(),
                                  //       ),
                                  // ),
                                  leading: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(
                                          4,
                                        ),
                                    child: Container(
                                      height: 50,
                                      width: 60,
                                      color: Colors.white,
                                    ),
                                  ),
                                  title: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                  subtitle: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          final items = snapshot.data!;
                          return RefreshIndicator(
                            onRefresh: () async {
                              setState(() {});
                            },
                            child: ListView.builder(
                              itemCount:
                                  snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final country =
                                    items[index];
                                String name =
                                    country.country!;

                                if (search.text.isEmpty) {
                                  return InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CountryDetailsView(
                                              country:
                                                  country,
                                            ),
                                      ),
                                    ),
                                    child: Card(
                                      child: ListTile(
                                        // leading: CircleAvatar(
                                        //   backgroundImage:
                                        //       NetworkImage(
                                        //         country
                                        //             .countryInfo!
                                        //             .flag!
                                        //             .toString(),
                                        //       ),
                                        // ),
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(
                                                4,
                                              ),
                                          child: Image.network(
                                            country
                                                .countryInfo!
                                                .flag!
                                                .toString(),
                                            height: 40,
                                            width: 60,
                                            fit: BoxFit
                                                .cover,
                                          ),
                                        ),
                                        title: Text(
                                          country.country
                                              .toString(),
                                        ),
                                        subtitle: Text(
                                          'Effected: ${country.cases.toString()}',
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (name
                                    .toLowerCase()
                                    .contains(
                                      search.text
                                          .toLowerCase(),
                                    )) {
                                  return Card(
                                    child: ListTile(
                                      // leading: CircleAvatar(
                                      //   backgroundImage:
                                      //       NetworkImage(
                                      //         country
                                      //             .countryInfo!
                                      //             .flag!
                                      //             .toString(),
                                      //       ),
                                      // ),
                                      leading: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(
                                              4,
                                            ),
                                        child: Image.network(
                                          country
                                              .countryInfo!
                                              .flag!
                                              .toString(),
                                          height: 40,
                                          width: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      title: Text(
                                        country.country
                                            .toString(),
                                      ),
                                      subtitle: Text(
                                        'Effected: ${country.cases.toString()}',
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          );
                        }
                      },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
