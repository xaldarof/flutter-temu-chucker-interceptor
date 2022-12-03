import 'package:flutter/material.dart';
import 'package:temu_interceptor/date.dart';
import 'package:temu_interceptor/fonts.dart';
import 'package:temu_interceptor/models/call_cache.dart';
import 'package:temu_interceptor/navigation/navigator.dart';
import 'package:temu_interceptor/screens/details_screen.dart';

class TemuCallListItemWidget extends StatelessWidget {
  final CallCacheModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 100,
      child: GestureDetector(
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            Text(
              model.statusCode ?? "...",
              style:
                  getTextStyle(color: model.statusCode == "200" ? Colors.green : Colors.redAccent),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${model.method} ${model.path}",
                  style: getTextStyle(),
                ),
                Text(
                  "${model.baseUrl}",
                  style: getTextStyle(size: 12, color: Colors.black54),
                ),
                Text(
                  "${model.date?.toDateHM()}",
                  style: getTextStyle(size: 12, color: Colors.black54),
                ),
              ],
            )
          ],
        ),
        onTap: () {
          print("Clicked : ${model.toString()}");
          context.navigateTo(DetailScreen(
            date: model.date ?? "",
          ));
        },
      ),
    );
  }

  const TemuCallListItemWidget({
    super.key,
    required this.model,
  });
}
