import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class FruitsVegetablesPage extends StatefulWidget {
  const FruitsVegetablesPage({Key? key}) : super(key: key);

  @override
  State<FruitsVegetablesPage> createState() => _FruitsVegetablesPageState();
}

class _FruitsVegetablesPageState extends State<FruitsVegetablesPage> {
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
    '10.png',
    '11.png',
    '12.png',
    '13.png',
    '14.png',
    '15.png',
    '16.png',
    '17.png',
  ];

  Map<String, String> letterWords = {
    '1.png': 'Tomato',
    '2.png': 'Eggplant',
    '3.png': 'Carrot',
    '4.png': 'Potato',
    '5.png': 'Cucumber',
    '6.png': 'Pea',
    '7.png': 'Onion',
    '8.png': 'Pepper',
    '9.png': 'Kiwi',
    '10.png': 'Pomegranate',
    '11.png': 'Cherry',
    '12.png': 'Banana',
    '13.png': 'Pear',
    '14.png': 'Strawberry',
    '15.png': 'Mandarin',
    '16.png': 'Grape',
    '17.png': 'Orange',
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
        title: Text('Fruits & Vegetables'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/FruitsVegetables/${letterImages[_currentIndex]}',
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
