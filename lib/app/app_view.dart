part of 'app.dart';

class APIClient extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    final isDev = !const bool.fromEnvironment('dart.vm.product');
    if (isDev) {
      baseUrl = 'http://localhost:9999';
    }
  }

  Future<Response<dynamic>> inc() async {
    return post('/inc', {});
  }
}

class Application extends StatelessWidget {
  final APIClient api = Get.put(APIClient());
  final RxInt count = 0.obs;

  Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter FastAPI'),
        ),
        body: Obx(
          () => Center(
            child: Text('clicked $count times'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final r = await api.inc();
            count(r.body['n'] as int);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
