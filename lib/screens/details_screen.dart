import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temu_interceptor/navigation/navigator.dart';
import 'package:temu_interceptor/screens/request_screen.dart';
import 'package:temu_interceptor/screens/response_screen.dart';

import '../fonts.dart';

class DetailScreen extends StatefulWidget {
  final String date;

  const DetailScreen({super.key, required this.date});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with TickerProviderStateMixin {
  var screens = [];

  var screenIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    screens = [
      RequestScreen(
        date: widget.date,
      ),
      ResponseScreen(
        date: widget.date,
      ),
    ];
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.goBack();
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Details',
          style: getTextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleTextStyle: getTextStyle(color: Colors.black),
        bottom: TabBar(
          onTap: (index) {
            setState(() {
              screenIndex = index;
            });
          },
          padding: const EdgeInsets.all(6),
          splashBorderRadius: BorderRadius.circular(24),
          controller: _tabController,
          labelStyle: getTextStyle(),
          unselectedLabelColor: Colors.black,
          indicator: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              color: Colors.black12),
          isScrollable: false,
          tabs: const [
            Tab(
              height: 42,
              text: 'Request',
            ),
            Tab(
              height: 42,
              text: 'Respoinse',
            ),
          ],
        ),
        toolbarHeight: 72,
      ),
      body: screens[screenIndex],
    );
  }
}
