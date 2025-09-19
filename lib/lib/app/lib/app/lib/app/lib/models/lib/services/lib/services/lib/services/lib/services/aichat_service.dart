class AIChatService {
  Future<String> sendMessage(String message) async {
    // TODO: Integrate with AI backend (OpenAI, Firebase Vertex AI, etc.)
    // For demo, echo the user's message after a short delay
    await Future.delayed(Duration(seconds: 1));
    return "AI response to: \"$message\"";
  }
}
