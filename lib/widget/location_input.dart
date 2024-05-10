import 'package:flutter/material.dart';

class LocationInputResult {
  final Widget widget;
  final String text;
  final VoidCallback onFetchNeeded;

  LocationInputResult({
    required this.widget,
    required this.text,
    required this.onFetchNeeded,
  });
}

LocationInputResult locationInput(
    BuildContext context, VoidCallback onFetchNeeded, controller) {
  Widget widget = Center(
      child: Column(children: [
    SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(238, 238, 238, 0.911),
              border: OutlineInputBorder(),
              hintText: 'Select',
              hintStyle: TextStyle(
                color: Color.fromARGB(75, 65, 61, 61),
              ),
            )),
      ),
    ),
    const SizedBox(
      height: 5,
    ),
    OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: const Color.fromRGBO(238, 238, 238, 0.801),
      ),
      onPressed: () {
        debugPrint('Received click => ${controller.text}');
        onFetchNeeded();
        controller.clear();
      },
      child: const Text('Obtenir la meteo',
          style: TextStyle(color: Colors.black54)),
    )
  ]));

  return LocationInputResult(
      widget: widget, text: controller.text, onFetchNeeded: onFetchNeeded);
}
