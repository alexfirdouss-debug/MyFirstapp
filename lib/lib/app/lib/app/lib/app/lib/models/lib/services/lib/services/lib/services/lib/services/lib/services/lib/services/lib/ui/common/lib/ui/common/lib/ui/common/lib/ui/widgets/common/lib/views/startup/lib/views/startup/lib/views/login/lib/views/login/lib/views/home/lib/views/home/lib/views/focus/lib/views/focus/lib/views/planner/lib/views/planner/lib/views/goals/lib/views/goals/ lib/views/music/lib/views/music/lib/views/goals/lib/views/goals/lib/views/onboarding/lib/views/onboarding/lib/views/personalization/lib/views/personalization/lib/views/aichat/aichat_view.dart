import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'aichat_viewmodel.dart';

class AIChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AIChatViewModel>.reactive(
      viewModelBuilder: () => AIChatViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('AI Chat')),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: model.scrollController,
                itemCount: model.messages.length,
                itemBuilder: (context, index) {
                  final message = model.messages[index];
                  return ListTile(
                    title: Align(
                      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: message.isUser ? Colors.blueAccent : Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          message.text,
                          style: TextStyle(
                              color: message.isUser ? Colors.white : Colors.black87),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: model.inputController,
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: model.isSending
                        ? CircularProgressIndicator()
                        : Icon(Icons.send),
                    onPressed: model.isSending ? null : model.sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}
