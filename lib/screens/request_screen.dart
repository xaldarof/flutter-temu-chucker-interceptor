import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:temu_interceptor/date.dart';

import '../box/box.dart';
import '../fonts.dart';
import '../models/call_cache.dart';

class RequestScreen extends StatelessWidget {
  final String date;

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
                return Container(
                  height: 300,
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.all(12),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Method',
                            style: getTextStyle(),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(6),
                          ),
                          Text(current.method ?? ""),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Base url',
                            style: getTextStyle(),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(6),
                          ),
                          Text(current.baseUrl ?? ""),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Endpoint',
                            style: getTextStyle(),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(6),
                          ),
                          Text(current.path ?? ""),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Started',
                            style: getTextStyle(),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(6),
                          ),
                          Text(current.startDate?.toDateHM() ?? ""),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Finished',
                            style: getTextStyle(),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(6),
                          ),
                          Text(current.endDate?.toDateHM() ?? ""),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Duration',
                            style: getTextStyle(),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(6),
                          ),
                          Text(
                              "${(((current.startDate ?? "").toDateTime().millisecond) - ((current.endDate ?? "").toDateTime().millisecond)).toString()}ms"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Bytes received',
                            style: getTextStyle(),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(6),
                          ),
                          Text("${current.totalReceived ?? "0"} bytes"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Bytes sent',
                            style: getTextStyle(),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(6),
                          ),
                          Text("${current.totalSent ?? "0"} bytes"),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return Text(
                  'nulll',
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

  const RequestScreen({
    super.key,
    required this.date,
  });
}
