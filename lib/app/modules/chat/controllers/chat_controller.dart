import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/chat/stores/chat_store.dart';
import 'package:frontend/app/modules/shared/models/message.dart';

class ChatController {
  final ChatStore chatStore = Modular.get<ChatStore>();

  Future<void> getChatList() async {
    //call endpoint get /chat and save to store
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
      timestamp: DateTime.now(),
      isAI: false,
    );
    chatStore.addMessage(message);

    //TODO call post /chat endpoint and save response in message
  }
}
