import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class NumbersPage extends StatefulWidget {
  const NumbersPage({Key? key}) : super(key: key);

  @override
  State<NumbersPage> createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
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
    '20.png',
    '30.png',
    '40.png',
    '50.png',
    '60.png',
    '70.png',
    '80.png',
    '90.png',
    '100.png',
  ];

  Map<String, String> letterWords = {
    '1.png': 'One',
    '2.png': 'Two',
    '3.png': 'Three',
    '4.png': 'Four',
    '5.png': 'Five',
    '6.png': 'Six',
    '7.png': 'Seven',
    '8.png': 'Eight',
    '9.png': 'Nine',
    '10.png': 'Ten',
    '20.png': 'Twenty',
    '30.png': 'Thirty',
    '40.png': 'Forty',
    '50.png': 'Fifty',
    '60.png': 'Sixty',
    '70.png': 'Seventy',
    '80.png': 'Eighty',
    '90.png': 'Ninety',
    '100.png': 'One Hundred',
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
        title: Text('Numbers'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Numbers/${letterImages[_currentIndex]}',
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
