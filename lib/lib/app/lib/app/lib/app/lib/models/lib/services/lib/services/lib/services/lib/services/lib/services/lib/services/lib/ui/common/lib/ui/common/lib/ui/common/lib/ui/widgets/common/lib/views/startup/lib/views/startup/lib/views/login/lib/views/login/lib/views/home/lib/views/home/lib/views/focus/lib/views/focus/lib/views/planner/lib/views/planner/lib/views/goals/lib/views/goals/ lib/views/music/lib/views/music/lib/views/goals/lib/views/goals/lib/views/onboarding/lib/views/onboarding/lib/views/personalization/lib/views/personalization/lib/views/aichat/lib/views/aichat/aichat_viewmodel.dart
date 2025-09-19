import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../services/aichat_service.dart';

class AIChatViewModel extends BaseViewModel {
  final inputController = TextEditingController();
  final scrollController = ScrollController();

  List<ChatMessage> messages = [];
  bool isSending = false;

  final AIChatService _chatService = AIChatService();

  Future<void> sendMessage() async {
    final text = inputController.text.trim();
    if (text.isEmpty) return;
    inputController.clear();
    messages.add(ChatMessage(text: text, isUser: true));
    notifyListeners();

    isSending = true;
    notifyListeners();

    final response = await _chatService.sendMessage(text);

    messages.add(ChatMessage(text: response, isUser: false));
    isSending = false;

    notifyListeners();

    // Scroll to bottom after slight delay to show new message
    await Future.delayed(Duration(milliseconds: 100));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 60,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    inputController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}
