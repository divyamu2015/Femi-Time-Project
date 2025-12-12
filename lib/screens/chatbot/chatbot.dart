import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key, required this.userId});
  final int userId;

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class ChatMessage {
  final String message;
  final bool isUser;
  ChatMessage({required this.message, required this.isUser});
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();

  Future<void> sendMessage(String message) async {
    setState(() {
      _messages.add(ChatMessage(message: message, isUser: true));
      _isLoading = true;
    });
    _scrollToBottom();

    final url = Uri.parse(
      "https://417sptdw-8005.inc1.devtunnels.ms/userapp/chatbot/",
    );

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          //  "user_id": widget.userId.toString(),
          "message": message,
        }),
      );
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        print(response.statusCode);
        print(data);

        setState(() {
          _messages.add(
            ChatMessage(
              message: data["reply"] ?? "No reply from server",
              isUser: false,
            ),
          );
          _isLoading = false;
        });
      } else {
        setState(() {
          _messages.add(
            ChatMessage(
              message: "Error: Server returned ${response.statusCode}",
              isUser: false,
            ),
          );
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _messages.add(ChatMessage(message: "Network Error: $e", isUser: false));
        _isLoading = false;
      });
    }

    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF19171D),
      appBar: AppBar(
        backgroundColor: Color(0xFF19171D),
        elevation: 0,
        title: Text(
          'AI Assistant',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Hi! I'm your AI Assistant 🤖\nHow can I help you today?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54, fontSize: 16),
            ),
          ),

          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return _chatBubble(isUser: msg.isUser, message: msg.message);
              },
            ),
          ),

          if (_isLoading)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircularProgressIndicator(color: Colors.deepPurpleAccent),
            ),

          _messageInputBar(),
        ],
      ),
    );
  }

  Widget _chatBubble({required bool isUser, required String message}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
      child: Row(
        mainAxisAlignment: isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) _avatar(),
          Flexible(
            child: Container(
              margin: isUser
                  ? EdgeInsets.only(left: 16)
                  : EdgeInsets.only(right: 16),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              decoration: BoxDecoration(
                color: isUser ? Color(0xFF8F62FE) : Color(0xFF22212A),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                message,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
          if (isUser) _avatar(isUser: true),
        ],
      ),
    );
  }

  Widget _avatar({bool isUser = false}) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: Colors.white10,
      child: Icon(
        isUser ? Icons.person : Icons.smart_toy,
        color: isUser ? Color(0xFF8F62FE) : Colors.white,
      ),
    );
  }

  Widget _messageInputBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: Color(0xFF22212A),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Type a message...",
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
              onSubmitted: (val) {
                final message = val.trim();
                if (message.isNotEmpty && !_isLoading) {
                  sendMessage(message);
                  _controller.clear();
                }
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              final text = _controller.text.trim();
              if (text.isNotEmpty && !_isLoading) {
                sendMessage(text);
                _controller.clear();
              }
            },
            child: CircleAvatar(
              backgroundColor: Color(0xFF8F62FE),
              child: Icon(Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
