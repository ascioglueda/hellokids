import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'BottomNavigationBar.dart'; // Doğru dosya adını buraya ekleyin

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  FlutterTts flutterTts = FlutterTts();
  List<String> messages = [
    "Hello, how are you?",
    "I'm fine, thank you.",
    "What's your name?",
    "My name is Eda.",
    "How old are you?",
    "I'm 22 years old",
    "Where are you from?",
    "I am from Denizli"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor:Colors.grey[200],
        title: Text('Dialog Page',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          if (index % 2 == 0) {
            // Even indexes represent user messages
            return _userMessage(messages[index]);
          } else {
            // Odd indexes represent bot messages
            return _botMessage(messages[index]);
          }
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Widget _userMessage(String message) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                message,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.volume_up),
            color: Colors.purple[700],
            onPressed: () {
              _speak(message);
            },
          ),
        ],
      ),
    );
  }

  Widget _botMessage(String message) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.volume_up),
            color: Colors.purple[700],
            onPressed: () {
              _speak(message);
            },
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.purple[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                message,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _speak(String message) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(message);
  }
}
