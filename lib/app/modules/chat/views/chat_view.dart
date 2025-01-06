import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/chat/controllers/chat_controller.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final ChatController chatController = ChatController();
  final TextEditingController messageController = TextEditingController();
  bool isLoading = false;

  void sendMessage() async {
    setState(() => isLoading = true);
    try {
      if (messageController.text.trim().isNotEmpty) {
        await chatController.sendMessage(
          messageController.text.trim(),
        );
        messageController.clear();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() => isLoading = false);
    }
  }

  void signOut() async {
    setState(() => isLoading = true);
    try {
      await chatController.signOut();
      Modular.to.navigate('/');
    } catch (e) {
      ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbot'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: signOut,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (_) {
                return ListView.builder(
                  itemCount: chatController.getChatLenght(),
                  itemBuilder: (context, index) {
                    final message = chatController.getMessage(index);
                    final bool isUserMessage = message.isAI!;
                    return Align(
                      alignment: isUserMessage
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        margin:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: isUserMessage ? Colors.blue : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          message.message ?? "",
                          style: TextStyle(
                            color: isUserMessage ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(

                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                (isLoading || chatController.getChatListLoading())? 
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: (){},
                    color: Colors.grey,
                  ) 
                : IconButton(
                    icon: Icon(Icons.send),
                    onPressed: sendMessage,
                    color: Colors.blue,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
