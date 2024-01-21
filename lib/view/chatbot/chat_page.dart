import 'package:flutter/material.dart';
import 'dart:async';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _qaPairs = [
    {"question": "What is my name?", "answer": "Your name is Arjun"},
    {"question": "What is your age?", "answer": "Your age is 32"},
    {
      "question": "What is my favorite color?",
      "answer": "Your favorite color is blue"
    },
    {"question": "What is my job?", "answer": "You are a software developer"},
    {"question": "Where do I live?", "answer": "You live in San Francisco"},
    {
      "question": "What is my favorite food?",
      "answer": "Your favorite food is pizza"
    },
    {"question": "What is my pet's name?", "answer": "Your pet's name is Max"},
    {
      "question": "What is my favorite movie?",
      "answer": "Your favorite movie is Inception"
    },
    {
      "question": "What is my favorite book?",
      "answer": "Your favorite book is 'To Kill a Mockingbird'"
    },
    {
      "question": "What is my favorite sport?",
      "answer": "Your favorite sport is basketball"
    },
    {
      "question": "What is my favorite team?",
      "answer": "Your favorite team is the Golden State Warriors"
    },
    {
      "question": "What is my favorite song?",
      "answer": "Your favorite song is 'Bohemian Rhapsody'"
    },
    {
      "question": "What is my favorite band?",
      "answer": "Your favorite band is Queen"
    },
    {
      "question": "What is my favorite TV show?",
      "answer": "Your favorite TV show is 'Breaking Bad'"
    },
    {
      "question": "What is my favorite video game?",
      "answer":
          "Your favorite video game is 'The Legend of Zelda: Breath of the Wild'"
    },
    {
      "question": "What is my favorite car?",
      "answer": "Your favorite car is the Tesla Model S"
    },
    {
      "question": "What is my favorite city?",
      "answer": "Your favorite city is New York City"
    },
    {
      "question": "What is my favorite country?",
      "answer": "Your favorite country is Italy"
    },
    {
      "question": "What is my favorite hobby?",
      "answer": "Your favorite hobby is reading"
    },
    {
      "question": "What is my favorite restaurant?",
      "answer": "Your favorite restaurant is 'The French Laundry'"
    },
    {
      "question": "What is my favorite drink?",
      "answer": "Your favorite drink is coffee"
    },
    {
      "question": "Why donate a tree?",
      "answer":
          "Donating a tree helps to combat climate change, improve air quality, conserve water, preserve biodiversity, and create a healthier environment for us all."
    },
    {
      "question": "What is a tree?",
      "answer":
          "A tree is a perennial plant with an elongated stem, or trunk, supporting branches and leaves in most species. They play a crucial role in our ecosystem by providing oxygen, improving air quality, climate amelioration, conserving water, preserving soil, and supporting wildlife."
    },
  ];

  List<Map<String, dynamic>> _messages = [];

  bool _isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Chat with BrikshyaAI',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Align(
                    alignment: message['isAI']
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: message['isAI'] ? Colors.blue : Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        message['text'],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          _isTyping
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "BrikshyaAI is typing...",
                      )),
                )
              : Container(),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          _buildMessageComposer(),
        ],
      ),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      color: Theme.of(context).cardColor,
      child: IconTheme(
        data: IconThemeData(color: Colors.accents.first),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: _controller,
                  onSubmitted: _handleSubmit,
                  decoration: InputDecoration.collapsed(
                    hintText: "Type a message...",
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmit(_controller.text),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSubmit(String text) {
    _controller.clear();

    // User's message
    _addMessage(text, false);

    // Simulate AI typing
    _simulateTyping();

    // Simulate AI response after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      _handleAIResponse(text);
      _stopTyping();
    });
  }

  void _simulateTyping() {
    setState(() {
      _isTyping = true;
    });
  }

  void _stopTyping() {
    setState(() {
      _isTyping = false;
    });
  }

  void _handleAIResponse(String question) {
    for (var qaPair in _qaPairs) {
      if (qaPair['question'] == question) {
        // AI's response
        _addMessage(qaPair['answer'], true);
        return;
      }
    }
    // Default response if no match is found
    _addMessage("I'm not sure how to answer that.", true);
  }

  void _addMessage(String text, bool isAI) {
    setState(() {
      _messages.insert(
        0,
        {"text": text, "isAI": isAI},
      );
    });
  }
}
