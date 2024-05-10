import 'package:flutter/material.dart';
import '../services/meteo_api.dart';
import '../widget/infosmeteo.dart';
import '../widget/meteo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MeteoAPI meteoAPI = MeteoAPI();
  var data;
  Future<void> getData(String? text) async {
    data = await meteoAPI.getMeteoAPI(text);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.darken),
              filterQuality: FilterQuality.high,
              image: const AssetImage('assets/images/backG.jpg'),
              fit: BoxFit.cover,
            ),
            //  ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(margin: EdgeInsets.all(10), child: chargement()),
        ),
      ),
    );
  }

  FutureBuilder<void> chargement() {
    return FutureBuilder(
      future: getData("londres"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erreur: ${snapshot.error}');
        } else {
          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                meteo(context, onPressed: () {
                  setState(() {
                    chargement();
                  });
                },
                    name: data['name'],
                    country: data['sys']['country'],
                    temp: data['main']['temp'],
                    status: data['weather'][0]['main']),
                infosmeteo(
                  context,
                  wind: data['wind']['speed'],
                  humility: data['main']['humidity'],
                  feel: data['main']['feels_like'],
                ),
              ]);
        }
      },
    );
  }
}
