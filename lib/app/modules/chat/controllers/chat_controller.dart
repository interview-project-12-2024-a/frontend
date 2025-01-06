import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/chat/stores/chat_store.dart';
import 'package:frontend/app/modules/shared/models/message.dart';
import 'package:frontend/app/modules/shared/services/web_service.dart';

class ChatController {
  final ChatStore chatStore = Modular.get<ChatStore>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final WebService webService = WebService();

  void getChatList() async {
    if(!chatStore.chatListLoading) {
      await webService.get('/chat').then((messageList) {
        for (var message in messageList.reversed) {
          Message msg = Message.fromMap(message);
          chatStore.addMessage(msg);
        }
        chatStore.setChatListLoading(false);
      });
    }
  }

  void loadNextPage() async {
    if(!chatStore.chatListLoading) {
      chatStore.setChatListLoading(true);
      await webService.get('/chat?timestamp=${chatStore.chat[0].timestamp}').then((messageList) {
        if(messageList.length == 0) {
          chatStore.setHaveMorePages(false);
        } else {
          for(var message in messageList.reversed) {
            Message msg = Message.fromMap(message);
            chatStore.addFront(msg);
          }
        }
        chatStore.setChatListLoading(false);
      });
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

  bool haveMorePages() {
    return chatStore.haveMorePages;
  }

  bool getChatListLoading() {
    return chatStore.chatListLoading;
  }

  Future<void> signOut() async {
    _auth.signOut();
  }
}
