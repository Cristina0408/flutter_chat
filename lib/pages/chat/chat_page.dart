import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/chat/widget/chat_messaje.dart';

import '../user/widgets/connect.dart';

class ChatPage extends StatefulWidget {
  final String? email;
  final String username;
  final String? imagePath;

  const ChatPage({
    super.key,
    required this.username,
    this.imagePath,
    this.email,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  final _textController = TextEditingController();

  final List<ChatMessage> _messages = [];

  bool _isWriting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 16,
                backgroundImage:
                    widget.imagePath != null && widget.imagePath!.isNotEmpty
                    ? FileImage(File(widget.imagePath!))
                    : null,
                backgroundColor: Colors.grey[400],
                child: (widget.imagePath == null || widget.imagePath!.isEmpty)
                    ? Text(
                        widget.username.substring(0, 2).toUpperCase(),
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )
                    : null,
              ),
            ),
            Text(widget.username),
          ],
        ),
        elevation: 3,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: ConnectionStatus(),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, i) => _messages[i],
              itemCount: _messages.length,
              reverse: true,
            ),
          ),
          Divider(height: 2),

          Container(color: Colors.white, height: 50, child: _inputChat()),
        ],
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String text) {
                  setState(() {
                    if (text.trim().isNotEmpty) {
                      _isWriting = true;
                    } else {
                      _isWriting = false;
                    }
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar mj:',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                focusNode: _focusNode,
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: !kIsWeb && Platform.isIOS
                  ? CupertinoButton(
                      onPressed: _isWriting
                          ? () => _handleSubmit(_textController.text.trim())
                          : null,
                      child: Text('Enviar'),
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.blue),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(Icons.send),
                          onPressed: _isWriting
                              ? () => _handleSubmit(_textController.text.trim())
                              : null,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmit(String text) {
    if (text.isEmpty) return;
    if (text.trim().isEmpty || widget.email == null) return;

    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMessage(
      text: text,
      senderEmail: widget.email!,
      currentUserEmail: widget.email!,
      animationController: AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
      ),
    );

    setState(() {
      _messages.insert(0, newMessage);
      newMessage.animationController.forward();

      _isWriting = false;
    });
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }

    super.dispose();
  }
}
