part of app;

class APIClient extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    bool isDev = !const bool.fromEnvironment('dart.vm.product');
    if (isDev) {
      baseUrl = 'http://localhost:9999';
    }
  }

  inc() async {
    return post('/inc', {});
  }
}

class Application extends StatelessWidget {
  final APIClient api = Get.put(APIClient());
  RxInt num = 0.obs;

  Application({Key? key}) : super(key: key);

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
            child: Text('clicked $num times'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var r = await api.inc();
            num(r.body['n']);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
