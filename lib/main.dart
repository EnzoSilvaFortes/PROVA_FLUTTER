import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trabalho Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/listar-pessoas': (context) => ListarPessoasScreen(),
        '/listar-livros': (context) => ListarLivrosScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/listar-pessoas');
              },
              child: Text('Ir para Listagem de Pessoas'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/listar-livros');
              },
              child: Text('Ir para Listagem de Livros'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListarPessoasScreen extends StatelessWidget {
  final List<Person> people = [
    Person.getExample(),
    Person.getExample(),
    Person.getExample(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem de Pessoas'),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          return CustomPersonWidget(person: people[index]);
        },
      ),
    );
  }
}

class ListarLivrosScreen extends StatelessWidget {
  final List<Book> books = [
    Book.getExample(),
    Book.getExample(),
    Book.getExample(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem de Livros'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return CustomBookWidget(book: books[index]);
        },
      ),
    );
  }
}

class CustomPersonWidget extends StatelessWidget {
  final Person person;

  CustomPersonWidget({required this.person});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(person.imagePath),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${person.name} ${person.lastname}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text('CPF: ${person.cpf}'),
                SizedBox(height: 4),
                Text('Telefone: ${person.number}'),
                SizedBox(height: 4),
                Text('Nascimento: ${person.birthday.toString().split(' ')[0]}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBookWidget extends StatelessWidget {
  final Book book;

  CustomBookWidget({required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Autor: ${book.author}'),
            SizedBox(height: 4),
            Text('Publicado em: ${book.publicationDate.toString().split(' ')[0]}'),
          ],
        ),
      ),
    );
  }
}

class Person {
  final String imagePath;
  final String id;
  final String name;
  final String lastname;
  final String number;
  final String cpf;
  final DateTime birthday;
  final DateTime registeredAt;

  Person({
    required this.imagePath,
    required this.id,
    required this.name,
    required this.lastname,
    required this.number,
    required this.cpf,
    required this.birthday,
    required this.registeredAt,
  });

  static Person getExample() {
    return Person(
      imagePath: 'assets/Levi.jpg',
      id: '12345',
      name: 'João',
      lastname: 'Silva',
      number: '123-456-7890',
      cpf: '123.456.789-00',
      birthday: DateTime(1990, 5, 15),
      registeredAt: DateTime.now(),
    );
  }
}

class Book {
  final String title;
  final String author;
  final DateTime publicationDate;

  Book({
    required this.title,
    required this.author,
    required this.publicationDate,
  });

  static Book getExample() {
    return Book(
      title: 'Flutter Essentials',
      author: 'John Doe',
      publicationDate: DateTime(2022, 3, 10),
    );
  }
}
