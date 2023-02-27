import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat UI'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ChatMessage(
              message: 'Hello there!',
              time: '11:30 AM',
              isMe: true,
            ),
            ChatMessage(
              message: 'Hi!',
              time: '11:31 AM',
              isMe: false,
            ),
            ChatMessage(
              message: 'How are you?',
              time: '11:32 AM',
              isMe: false,
            ),
            ChatMessage(
              message: 'I\'m good. How about you?',
              time: '11:33 AM',
              isMe: true,
            ),
            ChatMessage(
              message: 'I\'m doing well, thanks.',
              time: '11:34 AM',
              isMe: false,
            ),
            ChatMessage(
              message: 'Glad to hear that.',
              time: '11:35 AM',
              isMe: true,
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String message;
  final String time;
  final bool isMe;

  const ChatMessage({
    Key? key,
    required this.message,
    required this.time,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageBox = Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: isMe ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message,
            style: TextStyle(
              color: isMe ? Colors.white : Colors.black,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            time,
            style: TextStyle(
              color: isMe ? Colors.white70 : Colors.black54,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            if (!isMe) CircleAvatar(child: Text('A')),
            SizedBox(width: 8.0),
            messageBox,
            SizedBox(width: 8.0),
            if (isMe) CircleAvatar(child: Text('J')),
          ],
        ),
      ),
    );
  }
}