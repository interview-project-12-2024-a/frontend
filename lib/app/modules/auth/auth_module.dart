import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/auth/auth_routes.dart';
import 'package:frontend/app/modules/auth/views/auth_login_view.dart';
import 'package:frontend/app/modules/auth/views/auth_password_reset_view.dart';
import 'package:frontend/app/modules/auth/views/auth_register_view.dart';

class AuthModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(AuthRoutes.login, child: (context) => AuthLoginView());
    r.child(AuthRoutes.register, child: (context) => AuthRegisterView());
    r.child(AuthRoutes.passwordReset,
        child: (context) => AuthPasswordResetView());
  }
}
