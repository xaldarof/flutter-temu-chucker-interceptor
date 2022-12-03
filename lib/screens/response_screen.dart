import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

import '../box/box.dart';
import '../fonts.dart';
import '../models/call_cache.dart';

class ResponseScreen extends StatelessWidget {
  final String date;

  String prettyJson(String data) {
    final object = json.decode(data);
    final prettyString = const JsonEncoder.withIndent('     ').convert(object);

    return prettyString;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getBox<CallCacheModel>('calls'),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return ValueListenableBuilder(
            valueListenable: snapshot.data!.listenable(),
            builder: (context, Box<CallCacheModel> box, _) {
              var current = box.get(date);
              if (current != null) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          prettyJson(current.response ?? "") ?? "",
                          style: getTextStyle(size: 15, weight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Text(
                  "",
                  style: getTextStyle(),
                );
              }
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  const ResponseScreen({
    required this.date,
  });
}
