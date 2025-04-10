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
        '/listar': (context) => ListarScreen(),
      },
    );
  }
}

// Tela Inicial (Home)
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/listar');
          },
          child: Text('Ir para Listagem'),
        ),
      ),
    );
  }
}

// Tela de Listagem
class ListarScreen extends StatelessWidget {
  // Lista de objetos Person para exibir na tela
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

// Widget Personalizado para exibir informações das pessoas
class CustomPersonWidget extends StatelessWidget {
  final Person person;

  CustomPersonWidget({required this.person});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Foto da pessoa
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(person.imagePath), // Altere para AssetImage se usar assets locais
            ),
          ),
          // Informações da pessoa
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

// Classe Person
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

  // Método estático para obter um exemplo de instância da classe
  static Person getExample() {
    return Person(
      imagePath: 'https://via.placeholder.com/150', // Altere para 'assets/Levi.jpg' se usar uma imagem local
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
