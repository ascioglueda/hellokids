import 'package:hellokids/BottomNavigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ColorsPage extends StatefulWidget {
  const ColorsPage({Key? key}) : super(key: key);

  @override
  State<ColorsPage> createState() => _ColorsPageState();
}

class _ColorsPageState extends State<ColorsPage> {
  int _currentIndex = 0;
  List<String> letterImages = [
    'black.png',
    'blue.png',
    'brown.png',
    'green.png',
    'grey.png',
    'orange.png',
    'pink.png',
    'purple.png',
    'red.png',
    'yellow.png',
  ];

  Map<String, String> letterWords = {
    'black.png': 'Black',
    'blue.png': 'Blue',
    'brown.png': 'Brown',
    'green.png': 'Green',
    'grey.png': 'Grey',
    'orange.png': 'Orange',
    'pink.png': 'Pink',
    'purple.png': 'Purple',
    'red.png': 'Red',
    'yellow.png': 'Yellow',
  };

  FlutterTts flutterTts = FlutterTts();

  Future<void> _speakWord(String word) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.speak(word);
  }

  void _nextLetter() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % letterImages.length;
    });
  }

  void _prevLetter() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + letterImages.length) % letterImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor:Colors.grey[200],
        title: Text('Colors'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Color/${letterImages[_currentIndex]}',
                width: 400,
                height: 400,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Okunuşu: ${letterWords[letterImages[_currentIndex]] ?? ''}',
                    style: TextStyle(fontSize: 24),
                  ),
                  IconButton(
                    icon: Icon(Icons.volume_up),
                    color: Colors.purple[700],
                    iconSize: 40,
                    onPressed: () {
                      String? letterWord = letterWords[letterImages[_currentIndex]];
                      if (letterWord != null) {
                        _speakWord(letterWord);
                      }
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _prevLetter,
                      child: Text(
                        'Previous',
                        style: TextStyle(
                          color: Colors.purple[700],
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _nextLetter,
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.purple[700],
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

