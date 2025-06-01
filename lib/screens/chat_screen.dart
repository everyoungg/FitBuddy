import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:provider/provider.dart';
import 'package:fit_buddy_new/providers/chat_provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<types.Message> _messages = [];

  @override
  void initState() {
    super.initState();
    _addSystemMessage();
  }

  void _addSystemMessage() {
    const systemMessage = types.TextMessage(
      author: types.User(id: 'system'),
      id: 'system',
      text: '안녕하세요! FitBuddy 챗봇입니다. 운동에 대해 어떤 것이든 물어보세요!',
    );
    setState(() {
      _messages.insert(0, systemMessage);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: types.User(id: 'user'),
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: message.text,
    );

    setState(() {
      _messages.insert(0, textMessage);
    });

    _textController.clear();

    // 챗봇 응답 생성
    final botMessage = types.TextMessage(
      author: types.User(id: 'bot'),
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: '죄송합니다. 아직 응답을 생성하는 중입니다...',
    );

    setState(() {
      _messages.insert(0, botMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FitBuddy 챗봇'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        showUserAvatars: true,
        showUserNames: true,
        user: const types.User(id: 'user'),
      ),
    );
  }
} 