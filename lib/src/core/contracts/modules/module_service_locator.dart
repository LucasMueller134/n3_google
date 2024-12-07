import '../../services/service_locator/implementations/service_locator.dart';

abstract class ModuleServiceLocator {
  Future<void> registerBinds();

  T get<T extends Object>() => ServiceLocator.instance.get<T>();
}
