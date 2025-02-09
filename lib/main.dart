import 'package:flutter/material.dart';
import 'package:bookstore/screen/book_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> books = [
      {
        'imageUrl': 'assets/Harry_Potter_1.jpg',
        'title': 'Harry Potter and the Sorcerer\'s Stone',
        'author': 'J.K. Rowling',
        'price': 39.50,
      },
      {
        'imageUrl': 'assets/Harry_Potter_2.jpg',
        'title': 'Harry Potter and the Chamber of Secrets',
        'author': 'J.K. Rowling',
        'price': 40.80,
      },
      {
        'imageUrl': 'assets/Harry_Potter_3.jpg',
        'title': 'Harry Potter and the Prisoner of Azkaban',
        'author': 'J.K. Rowling',
        'price': 60.99,
      },
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 225, 67, 9),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Book Store'),
          backgroundColor: const Color.fromARGB(255, 225, 67, 9),
          leading: const Icon(Icons.menu, size: 30, color: Colors.white),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.search, size: 28, color: Colors.white),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: books.length,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: BookList(
                imageUrl: books[index]['imageUrl'],
                title: books[index]['title'],
                author: books[index]['author'],
                price: books[index]['price'],
                onBuyPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Buying ${books[index]['title']}'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}