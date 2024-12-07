import 'core/contracts/modules/module_service_locator.dart';
import 'core/core_service_locator.dart';

class AppInjections {
  static List<ModuleServiceLocator> modules = [
    CoreServiceLocator(),
  ];

  static Future<void> initialize() async {
    await Future.forEach(modules, (module) => module.registerBinds());
  }
}
