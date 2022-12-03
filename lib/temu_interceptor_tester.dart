import 'package:temu_interceptor/test/test_client.dart';

abstract class Testable {
  Future<void> test();
}

class TemuInterceptorTester extends Testable {
  @override
  Future<void> test() async {
    var response = await DioClient().get("comments");
    print(response.data);
    print(response.statusCode);
  }
}
