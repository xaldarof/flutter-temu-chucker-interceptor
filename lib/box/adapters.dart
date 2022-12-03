import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:temu_interceptor/models/call_cache.dart';

void initAdapters() async {
  Hive.init((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter<CallCacheModel>(CallCacheModelAdapter());
}
