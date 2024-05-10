import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/constant.dart';

Widget infosmeteo(
  BuildContext context, {
  required double wind,
  required int humility,
  required double feel,
}) {
  return Center(
    child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 7,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white, width: 1.9)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Wind", style: kMoreInfoFont),
                      Text("Humidity", style: kMoreInfoFont),
                      Text("FeelsLike", style: kMoreInfoFont),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('$wind', style: kMoreInfoFont),
                      Text('$humility', style: kMoreInfoFont),
                      Text('$feel°', style: kMoreInfoFont),
                    ],
                  )
                ],
              )),
        )),
  );
}
