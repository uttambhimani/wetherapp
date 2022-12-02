import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wetherapp/WetherModel.dart';

import 'provider_class.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Weather App"),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text("Surat"),
                    onTap: () {
                      Provider.of<HomeProvider>(context, listen: false)
                          .changeWeather("21.1702", "72.8311");
                    },
                  ),
                  PopupMenuItem(
                    child: InkWell(
                        onTap: () {
                          Provider.of<HomeProvider>(context, listen: false)
                              .changeWeather("26.809891", "80.273956");
                        },
                        child: Text("Ahmdabad")),
                  ),
                  PopupMenuItem(
                    child: Text("Rajkot"),
                    onTap: () {
                      Provider.of<HomeProvider>(context, listen: false)
                          .changeWeather("22.303894", "70.802162");
                    },
                  ),
                  PopupMenuItem(
                    child: Text("Jamnagar"),
                    onTap: () {
                      Provider.of<HomeProvider>(context, listen: false)
                          .changeWeather("22.470701", "70.057732");
                    },
                  ),
                  PopupMenuItem(
                    child: Text("Navasari"),
                    onTap: () {
                      Provider.of<HomeProvider>(context, listen: false)
                          .changeWeather("20.946701", "72.952034");
                    },
                  )
                ];
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
                height: 900,
                child: Image.network(
                    "https://mcdn.wallpapersafari.com/medium/40/19/sFg6A4.jpg",
                    fit: BoxFit.fill)),
            FutureBuilder<WetherModel>(
              future: Provider.of<HomeProvider>(context, listen: false)
                  .weatherapi(
                      Provider.of<HomeProvider>(context, listen: true).lan,
                      Provider.of<HomeProvider>(context, listen: true).lon),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  WetherModel data = snapshot.data!;
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text("${data.clouds!.all}°C",
                            style:
                                TextStyle(color: Colors.white, fontSize: 50)),
                        Text("${data.weather![0].main}",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 100,
                          width: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white,
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${data.clouds!.all}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Temprature",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${data.wind!.speed} km/h",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Wind Speed",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${data.wind!.deg}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Wind Degree",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 100,
                          width: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${data.main!.humidity}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Huminity",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${data.visibility} km/h",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Visibility",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${data.sys!.sunrise}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Sunrise",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
