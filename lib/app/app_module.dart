import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/auth/auth_module.dart';
import 'package:frontend/app/modules/chat/chat_module.dart';
import 'app_routes.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    // TODO: add config service
  }

  @override
  void routes(r) {
    r.module(AppRoutes.auth, module: AuthModule());
    r.module(AppRoutes.chat, module: ChatModule());
  }
}
