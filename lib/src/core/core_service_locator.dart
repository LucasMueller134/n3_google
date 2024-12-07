import 'contracts/modules/module_service_locator.dart';
import 'services/services.dart';

class CoreServiceLocator extends ModuleServiceLocator {
  @override
  Future<void> registerBinds() async {
    ServiceLocator.instance.bindFactory<IGoogleAuthService>(() => GoogleAuthService());
  }
}
