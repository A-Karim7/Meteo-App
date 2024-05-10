import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import '../utils/constant.dart';

Widget meteo(
  BuildContext context, {
  required VoidCallback onPressed,
  required String name,
  required String country,
  required double temp,
  required String status,
}) {
  return Container(
    width: MediaQuery.of(context).size.height,
    child: Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('$name, $country',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                      onPressed: onPressed,
                      icon: const Icon(
                        CupertinoIcons.refresh,
                        size: 30,
                        color: Colors.white,
                      ))
                ],
              ),
              Text('$temp°',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 80,
                  )),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width / 13,
              height: MediaQuery.of(context).size.height / 5,
              child: RotatedBox(
                quarterTurns: -1,
                child: Center(
                  child: Text(status,
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ))
        ],
      ),
    ),
  );
}
