import 'package:checkpoint2/components/contato.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contato> contatos = [
    Contato(
        title: 'John Doe',
        email: 'john_doeoe@gmail.com',
        foto: 'https://i.pravatar.cc/150?img=3'),
    Contato(
        title: 'Alice O. Austin',
        email: 'AliceOAustin@rhyta.com',
        foto: 'https://i.pravatar.cc/150?img=1'),
    Contato(
        title: 'Douglas R. Broadway',
        email: 'DouglasRBroadway@dayrep.com',
        foto: 'https://i.pravatar.cc/150?img=2'),
    Contato(
        title: 'Enrico T. Mazelli',
        email: 'enricomazelli@email.com',
        foto: 'https://i.pravatar.cc/150?img=37'),
    Contato(
        title: 'Luigi M. Silva',
        email: 'luigisilva@email.com',
        foto: 'https://i.pravatar.cc/150?img=58'),
  ];
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Contatos Favoritos ' + contador.toString()),
      ),
      body: ListView.builder(
          itemCount: contatos.length,
          itemBuilder: (context, i) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(contatos[i].foto),
              ),
              title: Text(contatos[i].title),
              subtitle: Text(contatos[i].email),
              trailing: IconButton(
                icon: contatos[i].status
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.favorite_border,
                      ),
                onPressed: () {
                  setState(() {
                    if (contatos[i].status) {
                      contador--;
                      contatos[i].status = false;
                    } else {
                      contador++;
                      contatos[i].status = true;
                    }
                  });
                },
              ),
            );
          }),
    );
  }
}
