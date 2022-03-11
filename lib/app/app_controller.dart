part of app;

class AppController extends GetxController {
  final bool isDev = !const bool.fromEnvironment('dart.vm.product');
}
