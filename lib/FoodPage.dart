import 'package:flutter_tts/flutter_tts.dart';
import 'package:hellokids/BottomNavigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int _currentIndex = 0;
  List<String> letterImages = [
    '1.png',
    '2.png',
    '3.png',
    '4.png',
    '5.png',
    '6.png',
    '7.png',
    '8.png',
    '9.png',

  ];

  Map<String, String> letterWords = {
    '1.png': 'Bread',
    '2.png': 'Milk',
    '3.png': 'Sugar',
    '4.png': 'Pizza',
    '5.png': 'Fries',
    '6.png': 'Pasta',
    '7.png': 'Egg',
    '8.png': 'Salad',
    '9.png': 'Hamburger',

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
        title: Text('Food'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Food/${letterImages[_currentIndex]}',
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
