import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'BottomNavigationBar.dart';

class WordsPage extends StatefulWidget {
  @override
  _WordsPageState createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  FlutterTts flutterTts = FlutterTts();
  List<String> words = [
    "Apple (Elma)",
    "Banana (Muz)",
    "Carrot (Havuç)",
    "Chicken (Tavuk)",
    "Pizza (Pizza)",
    "Watermelon (Karpuz)",
    "Tomato (Domates)",
    "Orange (Portakal)",
    "Table (Masa)",
    "Chair (Sandalye)",
    "Book (Kitap)",
    "Computer (Bilgisayar)",
    "North (Kuzey)",
    "South (Güney)",
    "East (Doğu)",
    "West (Batı)",
    "Monday (Pazartesi)",
    "Tuesday (Salı)",
    "Wednesday (Çarşamba)",
    "Thursday (Perşembe)",
    "Friday (Cuma)",
    "Saturday (Cumartesi)",
    "Sunday (Pazar)",
    "Coffee (Kahve)",
    "Tea (Çay)",
    "Juice (Meyve Suyu)",
    "Milk (Süt)",
    "Bread (Ekmek)",
    "Butter (Tereyağı)",
    "Cheese (Peynir)",
    "Egg (Yumurta)",
    "Salad (Salata)",
    "Soup (Çorba)",
    "Potato (Patates)",
    "Cucumber (Salatalık)",
    "Onion (Soğan)",
    "Lemon (Limon)",
    "Strawberry (Çilek)",
    "Grape (Üzüm)",
    "Pineapple (Ananas)",
    "Cabbage (Lahana)",
    "Broccoli (Brokoli)",
    "Zucchini (Kabak)",
    "Spinach (Ispanak)",
    "Carrot (Havuç)",
    "Cauliflower (Karnabahar)",
    "Garlic (Sarımsak)",
    "Avocado (Avokado)",
    "Melon (Kavun)",
    "Pear (Armut)",
    "Peach (Şeftali)",
    "Cherry (Kiraz)",
    "Laptop (Dizüstü Bilgisayar)",
    "Smartphone (Akıllı Telefon)",
    "Headphones (Kulaklık)",
    "Keyboard (Klavye)",
    "Mouse (Fare)",
    "Tablet (Tablet)",
    "Chair (Sandalye)",
    "Lamp (Lamba)",
    "Clock (Saat)",
    "Mirror (Ayna)",
    "Shoes (Ayakkabı)",
    "Socks (Çorap)",
    "T-shirt (Tişört)",
    "Jeans (Kot Pantolon)",
    "Dress (Elbise)",
    "Skirt (Etek)",
    "Hat (Şapka)",
    "Bag (Çanta)",
    "Sunglasses (Güneş Gözlüğü)",
    "Wallet (Cüzdan)",
    "Umbrella (Şemsiye)",
    "North (Kuzey)",
    "South (Güney)",
    "East (Doğu)",
    "West (Batı)",
  ];

  Random random = Random();

  String currentWord = "";
  @override
  void initState() {
    super.initState();
    _generateRandomWord();
  }

  // Rastgele kelime oluşturma işlevi
  void _generateRandomWord() {
    int index = random.nextInt(words.length);
    setState(() {
      currentWord = words[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor:Colors.grey[200],
        title: Text('Words Page',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    currentWord.split('(')[0].trim(),
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 5),
                IconButton(
                  icon: Icon(Icons.volume_up),
                  color: Colors.purple[700],
                  iconSize: 35,
                  onPressed: () {
                    _speak(currentWord.split('(')[0].trim());
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                currentWord.split('(')[1].replaceAll(')', '').trim(),
                style: TextStyle(fontSize: 25),
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _generateRandomWord();
               // _speak(currentWord.split(' ')[0]);
              },
              child: Text('Next Word'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Future<void> _speak(String word) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(word);
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }
}
