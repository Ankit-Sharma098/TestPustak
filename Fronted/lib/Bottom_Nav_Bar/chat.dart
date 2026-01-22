import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<_ChatMessage> _messages = [];

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(
        _ChatMessage(
          message: text,
          isUser: true,
        ),
      );

      // Simulated reply (for now)
      _messages.add(
        _ChatMessage(
          message: 'Thanks for your question. We will help you shortly.',
          isUser: false,
        ),
      );
    });

    _messageController.clear();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ask Your Doubt'),
      ),
      body: Column(
        children: [
          // 🔹 CHAT MESSAGES
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return _ChatBubble(
                  message: msg.message,
                  isUser: msg.isUser,
                );
              },
            ),
          ),

          // 🔹 MESSAGE INPUT
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type your doubt here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send),
                    color: Theme.of(context).primaryColor,
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 🔹 MODEL
class _ChatMessage {
  final String message;
  final bool isUser;

  _ChatMessage({
    required this.message,
    required this.isUser,
  });
}

// 🔹 CHAT BUBBLE UI
class _ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const _ChatBubble({
    required this.message,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
      isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: isUser
              ? Theme.of(context).primaryColor.withOpacity(0.15)
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}