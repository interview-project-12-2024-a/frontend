import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/auth/auth_routes.dart';
import 'package:frontend/app/modules/auth/stores/auth_store.dart';

class RouterGuard extends RouteGuard {
  RouterGuard() : super(redirectTo: AuthRoutes.login);

  AuthStore authStore = Modular.get<AuthStore>();

  @override
  bool canActivate(String path, ModularRoute route) {
    return (authStore.idToken != null);
  }
}
