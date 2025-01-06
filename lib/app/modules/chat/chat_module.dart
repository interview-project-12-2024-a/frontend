import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/chat/chat_routes.dart';
import 'package:frontend/app/modules/chat/views/chat_view.dart';

import 'stores/chat_store.dart';

class ChatModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(ChatStore.new);
  }

  @override
  void routes(r) {
    r.child(ChatRoutes.chat, child: (context) => ChatView());
  }
}
