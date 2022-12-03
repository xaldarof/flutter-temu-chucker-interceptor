import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:temu_interceptor/call_item_widget.dart';
import 'package:temu_interceptor/date.dart';
import 'package:temu_interceptor/fonts.dart';

import '../box/box.dart';
import '../models/call_cache.dart';

class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Request logs',
          style: getTextStyle(),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () async {
              (await getBox<CallCacheModel>('calls')).clear();
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getBox<CallCacheModel>('calls'),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ValueListenableBuilder(
              valueListenable: snapshot.data!.listenable(),
              builder: (context, Box<CallCacheModel> box, _) {

                if (box.values.isEmpty) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Nothing found...',
                      style: getTextStyle(),
                    ),
                  );
                } else {
                  box.values.toList().sort((b,a) => (b.date!.toDateTime()).millisecondsSinceEpoch.compareTo((a.date!.toDateTime().millisecondsSinceEpoch)));

                  return ListView.builder(
                    itemCount: box.values.length,
                    itemBuilder: (context, index) {
                      var item = box.getAt(index);
                      if (item != null) {
                        return TemuCallListItemWidget(
                          model: item,
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                }
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
