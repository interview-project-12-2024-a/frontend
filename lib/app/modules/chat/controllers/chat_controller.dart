import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/chat/stores/chat_store.dart';
import 'package:frontend/app/modules/shared/models/message.dart';
import 'package:frontend/app/modules/shared/services/web_service.dart';

class ChatController {
  final ChatStore chatStore = Modular.get<ChatStore>();
  final WebService webService = Modular.get<WebService>();

  Future<void> getChatList() async {
    List<dynamic> messageList = await webService.get('/chat');
    for (var message in messageList) {
      Message msg = Message.fromMap(message);
      chatStore.addMessage(msg);
    }
  }

  int getChatLenght() {
    return chatStore.chat.length;
  }

  Message getMessage(int idx) {
    return chatStore.chat[idx];
  }

  Future<void> sendMessage(String userMessage) async {
    var message = Message(
      message: userMessage,
      // timestamp: DateTime.now(),
      isAI: false,
    );
    chatStore.addMessage(message);
    Message response = Message.fromMap(await webService.post('/chat', message));
    chatStore.addMessage(response);
  }
}
