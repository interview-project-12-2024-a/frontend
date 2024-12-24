import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/auth/auth_module.dart';
import 'package:frontend/app/modules/auth/stores/auth_store.dart';
import 'package:frontend/app/modules/chat/chat_module.dart';
import 'package:frontend/app/modules/chat/controllers/chat_controller.dart';
import 'package:frontend/app/modules/chat/stores/chat_store.dart';
import 'app_routes.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(AuthStore.new);
    i.add(ChatStore.new);
    i.add(ChatController.new);
  }

  @override
  void routes(r) {
    r.module(AppRoutes.auth, module: AuthModule());
    r.module(AppRoutes.chat, module: ChatModule());
  }
}
