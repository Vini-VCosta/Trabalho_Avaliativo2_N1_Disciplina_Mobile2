import 'package:flutter/material.dart';


void main() => runApp(MyRoutes());

class MyRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        PersonagensScreen.routeName: (context) => PersonagensScreen(),
      },
      // Criando uma função para operar com rotas nomeadas.
      // Usamos esta função para identificar o nome da
      // rota que tem push, e criar a rota para a
      // tela correta.
      onGenerateRoute: (settings) {
        // Se você der push passamos argumentos pela rota
        if (settings.name == GaleriaScreen.routeName) {
          // envie os argumentos para a rota correta
          // digite: ScreenArguments.
          final args = settings.arguments as ScreenArguments;

          // Em seguida, extraia os dados necessários dos
          // os argumentos e passar os dados para a
          // tela correta.
          // configuração da estilização da tela
          return MaterialPageRoute(
            builder: (context) {
              return GaleriaScreen(
                title: args.title,
                message: args.message,
              );
            },
          );
        }
        // O código suporta apenas
        // PassArgumentsScreen.routeName a partir de agora.
        // Outros valores precisam ser implementados se precisarmos

        assert(false, 'Precisa implemetar ${settings.name}');
        return null;
      },
      title: 'Navegação com argumentos',
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seja Bem Vindo'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ​​botão que navega para uma rota nomeada.
            // A rota nomeada extrai os argumentos
            // sozinha.
            Text("    Seja muito bem vindo ao nosso projeto (em andamento) sobre Animes, Desenhos e Rpg's!",
                style: TextStyle(fontFamily: "Raleway", fontSize: 30, color: Colors.tealAccent, )),
            Card(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.asset("imagens/capa.jpg"),
                  ],
                ),),
            ),
            ElevatedButton(
              onPressed: () {
                // O que acontece:
                // Quando o usuário toca no botão,
                // navega para uma rota nomeada e
                // fornece os argumentos como um opcional de
                // parâmetro.
                Navigator.pushNamed(
                  context,
                  PersonagensScreen.routeName,
                  arguments: ScreenArguments(
                    'Personagens',
                    'Venha montar seu personagem com base nos dados que temos aqui',
                  ),
                );
              },
              child: Text('Dados de criação'),
            ),
            // O ​​botão que navega para uma rota nomeada.
            // Para esta rota, extraia os argumentos em
            // a função onGenerateRoute e envia
            // para a tela definida.
            Padding(padding: EdgeInsets.all(8)),
            ElevatedButton(
              onPressed: () {
                // Quando o usuário toca no botão,
                // navega para uma rota nomeada e
                // fornece os argumentos como um opcional de
                // parâmetro.
                Navigator.pushNamed(
                  context,
                  GaleriaScreen.routeName,
                  arguments: ScreenArguments(
                    'Galeria',
                    'Esta é nossa galeria com alguns exemplos de rostos para você se inspirar',
                  ),
                );
              },
              child: Text('Galeria de rostos'),
            ),
          ],
        ),
      ),
    );
  }
}

// Este widget que extrai os argumentos necessários de
// o ModalRoute.
class PersonagensScreen extends StatelessWidget {
  static const routeName = '/extractArguments';
  @override
  Widget build(BuildContext context) {
    // Extrai os argumentos do ModalRoute atual
    // configura e e envia como ScreenArguments.
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: ListView(
        children: <Widget>[
          Text(args.message),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Mapas'),
          ),
          ListTile(
            leading: Icon(Icons.add_business),
            title: Text('Lojas'),
          ),
          ListTile(
            leading: Icon(Icons.format_align_justify),
            title: Text('Magias'),
          ),
          Card(
            child: Container(
              child: Column(
                children: <Widget>[
                  Image.asset("imagens/imagem_fundo.jpeg"),
                ],),
            ),),
          //Botão Voltar (Leva para a tela Inicio)
          Card(
            child: ElevatedButton(
              child: Text("Voltar"),
              onPressed: () {
                Navigator.pop(context);
              },),)
        ],),);
 }
}

// W​widget aceita os argumentos necessários por meio do
// construtor
class GaleriaScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;

  // Este widget aceita os argumentos como construtor de
  // parâmetros, porém não extrai os argumentos de
  // o ModalRoute.
  // ----------------------------------
  // Os argumentos são extraídos pela função onGenerateRoute
  // declarada no widget MaterialApp.
  const GaleriaScreen({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          Text(message),
          Card(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Image.asset("imagens/personagemRPG.jpg"),
                ],),
            ),),
          Card(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Image.asset("imagens/personagemRPG2.jpg"),
                ],),
            ),),
          Card(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Image.asset("imagens/personagemRPG3.jpg"),
                ],),
            ),),
          Card(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Image.asset("imagens/personagemRPG4.jpg"),
                ],),
            ),),
          Card(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Image.asset("imagens/personagemRPG5.jpg"),
                ],),
            ),),
          Card(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Image.asset("imagens/personagemRPG6.jpg"),
                ],),
            ),),
          //Botão Voltar (Leva para a tela Personagens)
          Card(
            child: ElevatedButton(
              child: Text("Voltar"),
              onPressed: () {
                Navigator.pop(context);
              },),),
        ],),);
  }
}

// Podemos passar qualquer objeto para o parâmetro de argumentos.
// Neste exemplo, criamos uma classe que com título e uma
// mensagem
class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}