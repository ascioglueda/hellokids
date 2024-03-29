import 'package:hellokids/BottomNavigationBar.dart';
import 'package:hellokids/DialogPage.dart';
import 'package:hellokids/WordsPage.dart';
import 'package:flutter/material.dart';
import 'AlphabetPage.dart';
import 'NumbersPage.dart';
import 'ColorsPage.dart';
import 'AnimalsPage.dart';
import 'FruitsVegetablesPage.dart';
import 'FoodPage.dart';
import 'DirectionsPage.dart';
import 'DaysPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor:Colors.grey[200],
        title: Text(
          'Categories',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/categoriesCivciv.png',
                width: 175,
                height: 175,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AlphabetPage()),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/Alfabe.png',
                              width: 150,
                              height: 150,
                            ),
                          ),
                        ),
                        Text(
                          'Alphabet',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NumbersPage()),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                            child: Center(
                                child: Image.asset(
                                  'assets/Sayilar1.png',
                                  width: 150,
                                  height: 150,
                                )
                            ),
                        ),
                        Text(
                          'Numbers',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ColorsPage()),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Image.asset(
                                'assets/Renkler.png',
                                width: 150,
                                height: 150,
                              )
                          ),
                        ),
                        Text(
                          'Colors',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AnimalsPage()),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Image.asset(
                                'assets/Hayvanlar1.png',
                                width: 150,
                                height: 150,
                              )
                          ),
                        ),
                        Text(
                          'Animals',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FruitsVegetablesPage()),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Image.asset(
                                'assets/MeyveSebze.png',
                                width: 150,
                                height: 150,
                              )
                          ),
                        ),
                        Text(
                          'Fruits & Vegetables',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FoodPage()), // AlphabetPage doğru sayfa adını yansıtın
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Image.asset(
                                'assets/Food.png', // Alfabe görüntüsünün yolunu belirtin
                                width: 150,
                                height: 150,
                              )
                          ),
                        ),
                        Text(
                          'Food',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
           /*   Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DirectionsPage()), // AlphabetPage doğru sayfa adını yansıtın
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Image.asset(
                                'assets/Yonler1.png', // Alfabe görüntüsünün yolunu belirtin
                                width: 150,
                                height: 150,
                              )
                          ),
                        ),
                        Text(
                          'Directions',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DaysPage()), // AlphabetPage doğru sayfa adını yansıtın
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                           child: Center(
                              child: Image.asset(
                                'assets/Gunler1.png', // Alfabe görüntüsünün yolunu belirtin
                                width: 150,
                                height: 150,
                              )
                          ),
                        ),
                        Text(
                          'Days',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),*/
              SizedBox(height: 60),
            ],
          ),
        ),
      ),

      bottomNavigationBar: CustomBottomNavigationBar(), // CustomBottomNavigationBar kullanılmalı
    );
  }
}
