import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../user/widgets/connect.dart';

class ChatPage extends StatefulWidget {
  final String username;
  final String? imagePath;

  const ChatPage({super.key, required this.username, this.imagePath});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final FocusNode _focusNode = FocusNode();

  final _textController = TextEditingController();

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
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (_, i) => Text('$i'),
                reverse: true,
              ),
            ),
            Divider(height: 2),

            Container(color: Colors.white, height: 50, child: _inputChat()),
          ],
        ),
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
                onChanged: (String text) {},
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
                      child: Text('enviar'),
                      onPressed: () {
                        _handleSubmit(_textController.text);
                      },
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      child: IconButton(
                        icon: Icon(Icons.send, color: Colors.blue[300]),
                        onPressed: () {
                          _handleSubmit(_textController.text);
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmit(String texto) {
    print(texto);
    _textController.clear();
    _focusNode.requestFocus();
  }
}
