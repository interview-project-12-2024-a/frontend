import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/chat/controllers/chat_controller.dart';
import 'package:intl/intl.dart'; // Import intl package for formatting dates

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final ChatController chatController = ChatController();
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Load initial messages
    chatController.getChatList();

    // Attach listener for pagination
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !chatController.getChatListLoading() && chatController.haveMorePages()) {
        chatController.loadNextPage();
      }
    });
  }

  void sendMessage() async {
    setState(() => isLoading = true);
    try {
      if (messageController.text.trim().isNotEmpty) {
        await chatController.sendMessage(
          messageController.text.trim(),
        );
        messageController.clear();
        // Scroll to the bottom after sending a message
        scrollController.animateTo(
          scrollController.position.minScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
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

  // Format timestamp
  String formatTimestamp(DateTime timestamp) {
    return DateFormat('yyyy-MM-dd HH:mm').format(timestamp);
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
                  controller: scrollController,
                  reverse: true, // Show the latest messages at the bottom
                  itemCount: chatController.getChatListLoading()
                      ? 1
                      : chatController.getChatLenght(),
                  itemBuilder: (context, index) {
                    if (chatController.getChatListLoading()) {
                      return Center(child: CircularProgressIndicator());
                    }
                    final message = chatController.getMessage(index);
                    final bool isUserMessage = message.isAI!;
                    final timestamp = message.timestamp != null
                        ? DateTime.parse(message.timestamp!)
                        : DateTime.now(); // Use current time if no timestamp

                    return Align(
                      alignment: isUserMessage
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: isUserMessage
                              ? Colors.blue
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message.message ?? "",
                              style: TextStyle(
                                color: isUserMessage
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              formatTimestamp(timestamp),
                              style: TextStyle(
                                fontSize: 12,
                                color: isUserMessage
                                    ? Colors.white70
                                    : Colors.black54,
                              ),
                            ),
                          ],
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
                (isLoading || chatController.getChatListLoading())
                    ? IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {},
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

  @override
  void dispose() {
    scrollController.dispose();
    messageController.dispose();
    super.dispose();
  }
}
