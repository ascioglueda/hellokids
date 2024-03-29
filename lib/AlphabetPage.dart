import 'package:flutter/material.dart';
import 'package:hellokids/BottomNavigationBar.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AlphabetPage extends StatefulWidget {
  @override
  _AlphabetPageState createState() => _AlphabetPageState();
}

class _AlphabetPageState extends State<AlphabetPage> {
  int _currentIndex = 0;
  List<String> letterImages = [
    'a1harfi.png',
    'b1harfi.png',
    'c1harfi.png',
    'd1harfi.png',
    'e1harfi.png',
    'fharfi.png',
    'gharfi.png',
    'hharfi.png',
    'ıharfi.png',
    'jharfi.png',
    'kharfi.png',
    'lharfi.png',
    'mharfi.png',
    'nharfi.png',
    'oharfi.png',
    'pharfi.png',
    'qharfi.png',
    'rharfi.png',
    'sharfi.png',
    'tharfi.png',
    'uharfi.png',
    'vharfi.png',
    'wharfi.png',
    'xharfi.png',
    'yharfi.png',
    'zharfi.png',
  ];

  Map<String, String> letterWords = {
    'a1harfi.png': 'A',
    'b1harfi.png': 'B',
    'c1harfi.png': 'C',
    'd1harfi.png': 'D',
    'e1harfi.png': 'E',
    'fharfi.png': 'F',
    'gharfi.png': 'G',
    'hharfi.png': 'H',
    'ıharfi.png': 'I',
    'jharfi.png': 'J',
    'kharfi.png': 'K',
    'lharfi.png': 'L',
    'mharfi.png': 'M',
    'nharfi.png': 'N',
    'oharfi.png': 'O',
    'pharfi.png': 'P',
    'qharfi.png': 'Q',
    'rharfi.png': 'R',
    'sharfi.png': 'S',
    'tharfi.png': 'T',
    'uharfi.png': 'U',
    'vharfi.png': 'V',
    'wharfi.png': 'W',
    'xharfi.png': 'X',
    'yharfi.png': 'Y',
    'zharfi.png': 'Z',
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
        title: Text('Alphabet'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Alphabet/${letterImages[_currentIndex]}',
                width: 300,
                height: 300,
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
